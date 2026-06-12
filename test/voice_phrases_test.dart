import 'package:flutter_test/flutter_test.dart';
import 'package:dorodango/features/voice/services/voice_phrases.dart';

void main() {
  group('voice phrases', () {
    test('all supported languages have stop and wake phrases', () {
      expect(voiceSupportedLanguages.length, 10);
      for (final code in voiceSupportedLanguages) {
        expect(stopPhrasesFor(code), isNotEmpty, reason: 'stop $code');
        expect(wakePhrasesFor(code), isNotEmpty, reason: 'wake $code');
      }
    });

    test('stop is universal', () {
      for (final code in voiceSupportedLanguages) {
        expect(stopPhrasesFor(code), contains('stop'));
      }
    });

    test('wake phrases include the canonical hey doro everywhere', () {
      for (final code in voiceSupportedLanguages) {
        expect(wakePhrasesFor(code), contains('hey doro'));
      }
    });

    test('locale-specific variants are included', () {
      expect(wakePhrasesFor('ja'), contains('ヘイドロ'));
      expect(wakePhrasesFor('ru'), contains('эй доро'));
      expect(stopPhrasesFor('de'), contains('das ist alles'));
      expect(stopPhrasesFor('tr'), contains('bu kadar'));
    });
  });
}
