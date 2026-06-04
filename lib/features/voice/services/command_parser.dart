import '../../../core/constants/voice_commands.dart';

class CommandParser {
  String _languageCode = 'en';

  void setLocale(String languageCode) {
    _languageCode = languageCode;
  }

  VoiceCommand parse(String rawText) {
    final normalized = rawText.toLowerCase().trim();
    final patterns = VoiceCommandPatterns.patternsForLocale(_languageCode);

    for (final entry in patterns.entries) {
      for (final pattern in entry.value) {
        if (normalized.contains(pattern)) {
          return entry.key;
        }
      }
    }

    return VoiceCommand.unknown;
  }
}
