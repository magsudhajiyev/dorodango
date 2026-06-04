import 'package:flutter_test/flutter_test.dart';
import 'package:dorodango/data/models/build_stage.dart';
import 'package:dorodango/features/voice/services/command_parser.dart';
import 'package:dorodango/core/constants/voice_commands.dart';

void main() {
  group('BuildStage', () {
    test('has 5 stages', () {
      expect(BuildStage.values.length, 5);
    });

    test('next returns correct sequence', () {
      expect(BuildStage.coreForming.next, BuildStage.drying);
      expect(BuildStage.drying.next, BuildStage.dustingCapping);
      expect(BuildStage.dustingCapping.next, BuildStage.polishing);
      expect(BuildStage.polishing.next, BuildStage.finished);
      expect(BuildStage.finished.next, isNull);
    });

    test('isTerminal only for finished', () {
      for (final stage in BuildStage.values) {
        expect(stage.isTerminal, stage == BuildStage.finished);
      }
    });
  });

  group('CommandParser', () {
    final parser = CommandParser();

    test('recognizes next commands', () {
      expect(parser.parse('next'), VoiceCommand.next);
      expect(parser.parse('move on'), VoiceCommand.next);
      expect(parser.parse('continue'), VoiceCommand.next);
    });

    test('recognizes repeat commands', () {
      expect(parser.parse('repeat'), VoiceCommand.repeat);
      expect(parser.parse('say again'), VoiceCommand.repeat);
    });

    test('recognizes help commands', () {
      expect(parser.parse('help'), VoiceCommand.help);
      expect(parser.parse('what do i do'), VoiceCommand.help);
    });

    test('returns unknown for unrecognized input', () {
      expect(parser.parse('hello world'), VoiceCommand.unknown);
      expect(parser.parse('banana'), VoiceCommand.unknown);
    });

    test('is case insensitive', () {
      expect(parser.parse('NEXT'), VoiceCommand.next);
      expect(parser.parse('Help'), VoiceCommand.help);
    });

    test('respects locale setting', () {
      parser.setLocale('fr');
      expect(parser.parse('suivant'), VoiceCommand.next);
      expect(parser.parse('aide'), VoiceCommand.help);
      expect(parser.parse('next'), VoiceCommand.unknown);

      parser.setLocale('en'); // reset
      expect(parser.parse('next'), VoiceCommand.next);
    });
  });

  group('VoiceCommandPatterns', () {
    test('all 10 locales have patterns', () {
      const expectedLocales = ['en', 'fr', 'de', 'es', 'ja', 'tr', 'az', 'ru', 'it', 'pt'];
      for (final locale in expectedLocales) {
        final patterns = VoiceCommandPatterns.patternsForLocale(locale);
        expect(patterns.isNotEmpty, isTrue, reason: 'Missing patterns for $locale');
      }
    });

    test('fallback to English for unknown locale', () {
      final patterns = VoiceCommandPatterns.patternsForLocale('xx');
      expect(patterns, VoiceCommandPatterns.localizedPatterns['en']);
    });
  });
}
