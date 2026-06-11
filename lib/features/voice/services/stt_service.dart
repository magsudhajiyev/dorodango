import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class SttService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;
  String _localeId = 'en_US';

  /// Reports raw speech_to_text status changes ('listening', 'done', ...).
  /// Used by conversation mode to detect a turn that ended in silence.
  void Function(String status)? onStatus;

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
      onStatus: (status) => onStatus?.call(status),
    );
    return _isInitialized;
  }

  void setLocale(String languageCode) {
    _localeId = _localeMap[languageCode] ?? 'en_US';
  }

  Future<void> startListening({
    required void Function(String text, bool isFinal) onResult,
    Duration pauseFor = const Duration(seconds: 4),
    Duration listenFor = const Duration(seconds: 30),
  }) async {
    if (!_isInitialized) await initialize();

    await _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        onResult(result.recognizedWords, result.finalResult);
      },
      listenOptions: stt.SpeechListenOptions(
        listenMode: stt.ListenMode.confirmation,
        cancelOnError: true,
        partialResults: true,
        localeId: _localeId,
        pauseFor: pauseFor,
        listenFor: listenFor,
      ),
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;
}
