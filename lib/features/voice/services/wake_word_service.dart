import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:porcupine_flutter/porcupine_manager.dart';
import 'package:porcupine_flutter/porcupine_error.dart';

/// Dedicated on-device "Hey Doro" wake-word engine (Picovoice Porcupine).
///
/// Unlike the OS speech recognizer, Porcupine is built for always-on,
/// low-power listening — it does not chime, does not get throttled, and
/// fires reliably. It holds the microphone while armed, so callers must
/// [stop] it before handing the mic to speech-to-text, then [start] it
/// again when the conversation ends.
///
/// Setup (provided by the developer, not bundled):
///   * AccessKey via `--dart-define=PICOVOICE_ACCESS_KEY=...`
///   * A "Hey Doro" keyword model trained at console.picovoice.ai,
///     dropped in as `assets/wake/hey_doro_<platform>.ppn`
class WakeWordService {
  static const _accessKey = String.fromEnvironment('PICOVOICE_ACCESS_KEY');
  static const _androidKeyword = 'assets/wake/hey_doro_android.ppn';
  static const _iosKeyword = 'assets/wake/hey_doro_ios.ppn';

  PorcupineManager? _manager;
  void Function()? _onWake;
  bool _running = false;

  /// Whether an AccessKey was compiled in. (The keyword model is checked
  /// at [start] time, since a missing asset only fails when loaded.)
  bool get isConfigured => _accessKey.isNotEmpty;

  String get _keywordAsset =>
      (!kIsWeb && Platform.isIOS) ? _iosKeyword : _androidKeyword;

  /// Arms the wake word. Returns false if it couldn't start (missing key,
  /// missing model, or mic unavailable) so the caller can fall back.
  Future<bool> start(void Function() onWake) async {
    if (!isConfigured) return false;
    _onWake = onWake;
    try {
      _manager ??= await PorcupineManager.fromKeywordPaths(
        _accessKey,
        [_keywordAsset],
        (_) => _onWake?.call(),
        sensitivities: [0.65],
        errorCallback: (e) => debugPrint('[Wake] process: ${e.message}'),
      );
      await _manager!.start();
      _running = true;
      debugPrint('[Wake] armed');
      return true;
    } on PorcupineException catch (e) {
      debugPrint('[Wake] init failed: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('[Wake] start failed: $e');
      return false;
    }
  }

  Future<void> stop() async {
    if (!_running) return;
    _running = false;
    try {
      await _manager?.stop();
      debugPrint('[Wake] disarmed');
    } catch (_) {}
  }

  Future<void> dispose() async {
    _running = false;
    _onWake = null;
    try {
      await _manager?.delete();
    } catch (_) {}
    _manager = null;
  }
}
