import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  Completer<void>? _speakCompleter;

  static const _localeMap = {
    'en': 'en-US',
    'fr': 'fr-FR',
    'de': 'de-DE',
    'es': 'es-ES',
    'ja': 'ja-JP',
    'tr': 'tr-TR',
    'az': 'az-AZ',
    'ru': 'ru-RU',
    'it': 'it-IT',
    'pt': 'pt-BR',
  };

  Future<void> initialize() async {
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);

    _tts.setCompletionHandler(() {
      _speakCompleter?.complete();
      _speakCompleter = null;
    });

    _isInitialized = true;
  }

  Future<void> setLocale(String languageCode) async {
    if (!_isInitialized) await initialize();
    final ttsCode = _localeMap[languageCode] ?? 'en-US';
    await _tts.setLanguage(ttsCode);
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) await initialize();
    _speakCompleter = Completer<void>();
    await _tts.speak(text);
    await _speakCompleter!.future;
  }

  Future<void> stop() async {
    _speakCompleter?.complete();
    _speakCompleter = null;
    await _tts.stop();
  }
}
