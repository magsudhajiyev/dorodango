import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class SttService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;
  String _localeId = 'en_US';

  /// Reports raw speech_to_text status changes ('listening', 'done', ...).
  /// Used by conversation mode to detect a turn that ended in silence.
  void Function(String status)? onStatus;

  /// Reports recognition errors ('error_busy', 'error_no_match', ...).
  void Function(String errorMsg)? onError;

  static const _localeMap = {
    'en': 'en_US',
    'fr': 'fr_FR',
    'de': 'de_DE',
    'es': 'es_ES',
    'ja': 'ja_JP',
    'tr': 'tr_TR',
    'az': 'az_AZ',
    'ru': 'ru_RU',
    'it': 'it_IT',
    'pt': 'pt_BR',
  };

  Future<bool> initialize() async {
    _isInitialized = await _speech.initialize(
      onStatus: (status) {
        debugPrint('[Voice] stt status: $status');
        onStatus?.call(status);
      },
      onError: (error) {
        debugPrint('[Voice] stt error: ${error.errorMsg} '
            '(permanent: ${error.permanent})');
        onError?.call(error.errorMsg);
      },
    );
    debugPrint('[Voice] stt initialize -> $_isInitialized');
    return _isInitialized;
  }

  void setLocale(String languageCode) {
    final next = _localeMap[languageCode] ?? 'en_US';
    if (next != _localeId) {
      _localeId = next;
      _resolvedLocaleId = null;
    }
  }

  String? _resolvedLocaleId;

  /// Uses the requested locale when the device's recognizer supports it,
  /// falling back to a same-language variant and finally to en_US, so
  /// listening never fails just because a speech pack is missing.
  Future<String> _resolveLocaleId() async {
    final cached = _resolvedLocaleId;
    if (cached != null) return cached;
    try {
      final available = await _speech.locales();
      if (available.isEmpty) return _resolvedLocaleId = _localeId;
      String normalize(String id) => id.replaceAll('-', '_');
      final ids = available.map((l) => normalize(l.localeId)).toList();
      if (ids.contains(_localeId)) return _resolvedLocaleId = _localeId;
      final language = _localeId.split('_').first;
      final sameLanguage = ids.where((id) => id.startsWith('${language}_'));
      if (sameLanguage.isNotEmpty) {
        return _resolvedLocaleId = sameLanguage.first;
      }
      debugPrint('[Voice] locale $_localeId unavailable, using en_US');
      return _resolvedLocaleId = 'en_US';
    } catch (_) {
      return _resolvedLocaleId = _localeId;
    }
  }

  /// Returns false when the recognizer could not be started — callers must
  /// not pretend to be listening in that case.
  Future<bool> startListening({
    required void Function(String text, bool isFinal) onResult,
    Duration pauseFor = const Duration(seconds: 4),
    Duration listenFor = const Duration(seconds: 30),
    bool dictation = false,
  }) async {
    if (!_isInitialized) await initialize();
    if (!_isInitialized) {
      onError?.call('error_not_available');
      return false;
    }
    final localeId = await _resolveLocaleId();

    try {
      await _speech.listen(
        onResult: (SpeechRecognitionResult result) {
          debugPrint('[Voice] stt ${result.finalResult ? "final" : "partial"}: '
              '"${result.recognizedWords}"');
          onResult(result.recognizedWords, result.finalResult);
        },
        listenOptions: stt.SpeechListenOptions(
          // Dictation keeps the session alive through long silences —
          // used by the wake-word loop so the start-of-listening chime
          // doesn't fire every few seconds.
          listenMode:
              dictation ? stt.ListenMode.dictation : stt.ListenMode.confirmation,
          cancelOnError: true,
          partialResults: true,
          localeId: localeId,
          pauseFor: pauseFor,
          listenFor: listenFor,
        ),
      );
      debugPrint('[Voice] stt listen started');
      return true;
    } catch (e) {
      debugPrint('[Voice] stt listen failed: $e');
      onError?.call('listen_failed');
      return false;
    }
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }

  /// Hard-resets the recognizer session. Some Android recognizers refuse a
  /// new [startListening] right after TTS unless the old session is
  /// cancelled first.
  Future<void> cancel() async {
    try {
      await _speech.cancel();
    } catch (_) {}
  }

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;
}
