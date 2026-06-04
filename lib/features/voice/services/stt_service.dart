import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class SttService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;
  String _localeId = 'en_US';

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
    _isInitialized = await _speech.initialize();
    return _isInitialized;
  }

  void setLocale(String languageCode) {
    _localeId = _localeMap[languageCode] ?? 'en_US';
  }

  Future<void> startListening({
    required void Function(String text, bool isFinal) onResult,
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
      ),
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;
}
