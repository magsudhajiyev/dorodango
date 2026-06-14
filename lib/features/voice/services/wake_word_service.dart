import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:vosk_flutter_2/vosk_flutter_2.dart';

/// On-device "Hey Doro" wake word powered by Vosk — open source, no API key,
/// no account, no chime. Vosk keeps a single continuous recognition stream
/// on the raw microphone (unlike the OS recognizer, which cycles sessions),
/// so detection is steady and low-power.
///
/// It holds the mic while armed, so callers [stop] it before handing the mic
/// to speech-to-text, then [start] it again when the conversation ends.
///
/// The model is downloaded once (~40 MB) on first use and cached on device.
/// Vosk's model is English, so wake detection is English-only — but "Hey
/// Doro" is a brand name spoken the same in any language, and the
/// conversation that follows is still fully multilingual.
class WakeWordService {
  static const _modelUrl =
      'https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip';
  static const _modelName = 'vosk-model-small-en-us-0.15';
  static const int _sampleRate = 16000;

  final VoskFlutterPlugin _vosk = VoskFlutterPlugin.instance();
  Model? _model;
  Recognizer? _recognizer;
  SpeechService? _speech;
  StreamSubscription<String>? _partialSub;
  StreamSubscription<String>? _resultSub;
  void Function()? _onWake;
  bool _running = false;
  bool _initializing = false;

  /// "Hey Doro" as the en-US small model actually transcribes it. "Doro"
  /// isn't a dictionary word, so we accept the nearest real-word
  /// renderings: a "hey/hi/a/ok" lead-in followed by a d/t word that
  /// sounds like "doro".
  static final RegExp _wakeRegex = RegExp(
    r'\b(?:hey|hay|hi|a|ok|okay)\s+'
    r"(?:door|doors|doro|dora|dore|dado|duro|dur|dough|doe|"
    r"though|thoro|thorough|toro|tora|tor|drow|dro|dorow)\b",
  );

  /// Vosk needs no key, so the toggle is always available.
  bool get isConfigured => true;

  /// Arms the wake word. Returns false if it couldn't start (model download
  /// failed, mic denied). [onPreparing] fires when a one-time model download
  /// is about to begin, so the UI can show progress.
  Future<bool> start(
    void Function() onWake, {
    void Function()? onPreparing,
  }) async {
    _onWake = onWake;
    if (_running) return true;
    if (_initializing) return false;
    _initializing = true;
    try {
      if (_speech == null) {
        final loader = ModelLoader();
        if (!await loader.isModelAlreadyLoaded(_modelName)) {
          onPreparing?.call();
        }
        final modelPath = await loader.loadFromNetwork(_modelUrl);
        _model = await _vosk.createModel(modelPath);
        _recognizer = await _vosk.createRecognizer(
          model: _model!,
          sampleRate: _sampleRate,
        );
        _speech = await _vosk.initSpeechService(_recognizer!);
        // A short shout may only produce a final result, so watch both.
        _partialSub = _speech!.onPartial().listen(_onHeard);
        _resultSub = _speech!.onResult().listen(_onHeard);
      }
      await _speech!.start();
      _running = true;
      debugPrint('[Wake] vosk armed');
      return true;
    } catch (e) {
      debugPrint('[Wake] start failed: $e');
      return false;
    } finally {
      _initializing = false;
    }
  }

  void _onHeard(String result) {
    if (!_running) return;
    final lower = result.toLowerCase();
    // Vosk returns JSON like {"partial":"hey door"} / {"text":"hey door"};
    // log only when there's actual text so we can see what it hears.
    final text = RegExp(r'"(?:partial|text)"\s*:\s*"([^"]*)"')
            .firstMatch(lower)
            ?.group(1) ??
        '';
    if (text.trim().isNotEmpty) {
      debugPrint('[Wake] heard: "$text"');
    }
    if (_wakeRegex.hasMatch(lower)) {
      debugPrint('[Wake] MATCH -> waking');
      _onWake?.call();
    }
  }

  Future<void> stop() async {
    if (!_running) return;
    _running = false;
    try {
      await _speech?.stop();
      await _speech?.reset();
    } catch (_) {}
    debugPrint('[Wake] vosk disarmed');
  }

  Future<void> dispose() async {
    _running = false;
    _onWake = null;
    await _partialSub?.cancel();
    await _resultSub?.cancel();
    _partialSub = null;
    _resultSub = null;
    try {
      await _speech?.dispose();
    } catch (_) {}
    _speech = null;
    _recognizer = null;
    _model = null;
  }
}
