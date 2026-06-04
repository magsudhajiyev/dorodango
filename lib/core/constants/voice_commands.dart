enum VoiceCommand {
  next,
  repeat,
  help,
  diagnose,
  howLongToDry,
  whatWentWrong,
  unknown,
}

abstract final class VoiceCommandPatterns {
  static const Map<String, Map<VoiceCommand, List<String>>> localizedPatterns = {
    'en': {
      VoiceCommand.next: ['next', 'next step', 'continue', 'move on', 'advance', 'go to next'],
      VoiceCommand.repeat: ['repeat', 'say again', 'what was that', 'again', 'one more time'],
      VoiceCommand.help: ['help', 'where am i', 'what stage', 'what do i do'],
      VoiceCommand.diagnose: ['diagnose', 'check this', 'look at this', 'what does this look like'],
      VoiceCommand.howLongToDry: ['how long', 'dry time', 'how long do i dry', 'drying time', 'when is it ready'],
      VoiceCommand.whatWentWrong: ['what went wrong', 'problem', 'mistake', 'issue', 'why did this happen'],
    },
    'fr': {
      VoiceCommand.next: ['suivant', 'étape suivante', 'continuer', 'avancer', 'passer'],
      VoiceCommand.repeat: ['répéter', 'répète', 'encore', 'redis', 'une fois de plus'],
      VoiceCommand.help: ['aide', 'où en suis-je', 'quelle étape', 'que faire'],
      VoiceCommand.diagnose: ['diagnostiquer', 'vérifie', 'regarde', 'à quoi ça ressemble'],
      VoiceCommand.howLongToDry: ['combien de temps', 'temps de séchage', 'quand est-ce prêt'],
      VoiceCommand.whatWentWrong: ['problème', 'erreur', 'qu\'est-ce qui ne va pas', 'pourquoi'],
    },
    'de': {
      VoiceCommand.next: ['weiter', 'nächster schritt', 'fortfahren', 'vorwärts', 'nächste'],
      VoiceCommand.repeat: ['wiederholen', 'nochmal', 'wie bitte', 'noch einmal'],
      VoiceCommand.help: ['hilfe', 'wo bin ich', 'welche stufe', 'was soll ich tun'],
      VoiceCommand.diagnose: ['diagnose', 'überprüfen', 'schau mal', 'wie sieht das aus'],
      VoiceCommand.howLongToDry: ['wie lange', 'trockenzeit', 'wann ist es fertig'],
      VoiceCommand.whatWentWrong: ['was ist schief gelaufen', 'problem', 'fehler', 'warum'],
    },
    'es': {
      VoiceCommand.next: ['siguiente', 'siguiente paso', 'continuar', 'avanzar', 'pasar'],
      VoiceCommand.repeat: ['repetir', 'repite', 'otra vez', 'de nuevo', 'una vez más'],
      VoiceCommand.help: ['ayuda', 'dónde estoy', 'qué etapa', 'qué hago'],
      VoiceCommand.diagnose: ['diagnosticar', 'revisar', 'mira esto', 'cómo se ve'],
      VoiceCommand.howLongToDry: ['cuánto tiempo', 'tiempo de secado', 'cuándo estará listo'],
      VoiceCommand.whatWentWrong: ['qué salió mal', 'problema', 'error', 'por qué pasó esto'],
    },
    'ja': {
      VoiceCommand.next: ['次', '次のステップ', '続ける', '進む', '次へ'],
      VoiceCommand.repeat: ['繰り返し', 'もう一度', '何だった', 'リピート'],
      VoiceCommand.help: ['ヘルプ', '助けて', '今どこ', '何をする'],
      VoiceCommand.diagnose: ['診断', 'チェック', '見て', 'どう見える'],
      VoiceCommand.howLongToDry: ['どのくらい', '乾燥時間', 'いつ準備できる'],
      VoiceCommand.whatWentWrong: ['何が問題', '間違い', '失敗', 'なぜ'],
    },
    'tr': {
      VoiceCommand.next: ['sonraki', 'sonraki adım', 'devam', 'ilerle', 'geç'],
      VoiceCommand.repeat: ['tekrar', 'tekrarla', 'bir daha', 'yine', 'bir kez daha'],
      VoiceCommand.help: ['yardım', 'neredeyim', 'hangi aşama', 'ne yapayım'],
      VoiceCommand.diagnose: ['tanı', 'kontrol et', 'bak', 'nasıl görünüyor'],
      VoiceCommand.howLongToDry: ['ne kadar sürer', 'kuruma süresi', 'ne zaman hazır'],
      VoiceCommand.whatWentWrong: ['ne oldu', 'sorun', 'hata', 'neden oldu'],
    },
    'az': {
      VoiceCommand.next: ['növbəti', 'növbəti addım', 'davam', 'irəli', 'keç'],
      VoiceCommand.repeat: ['təkrar', 'təkrarla', 'bir daha', 'yenə'],
      VoiceCommand.help: ['kömək', 'haradayam', 'hansı mərhələ', 'nə edim'],
      VoiceCommand.diagnose: ['diaqnoz', 'yoxla', 'bax', 'necə görünür'],
      VoiceCommand.howLongToDry: ['nə qədər vaxt', 'quruma vaxtı', 'nə vaxt hazır olacaq'],
      VoiceCommand.whatWentWrong: ['nə oldu', 'problem', 'səhv', 'niyə belə oldu'],
    },
    'ru': {
      VoiceCommand.next: ['дальше', 'следующий шаг', 'продолжить', 'вперёд', 'следующий'],
      VoiceCommand.repeat: ['повторить', 'повтори', 'ещё раз', 'снова', 'что было'],
      VoiceCommand.help: ['помощь', 'где я', 'какой этап', 'что делать'],
      VoiceCommand.diagnose: ['диагноз', 'проверь', 'посмотри', 'как это выглядит'],
      VoiceCommand.howLongToDry: ['сколько времени', 'время сушки', 'когда будет готово'],
      VoiceCommand.whatWentWrong: ['что пошло не так', 'проблема', 'ошибка', 'почему'],
    },
    'it': {
      VoiceCommand.next: ['avanti', 'prossimo passo', 'continuare', 'prosegui', 'prossimo'],
      VoiceCommand.repeat: ['ripetere', 'ripeti', 'ancora', 'di nuovo', 'un\'altra volta'],
      VoiceCommand.help: ['aiuto', 'dove sono', 'che fase', 'cosa devo fare'],
      VoiceCommand.diagnose: ['diagnostica', 'controlla', 'guarda', 'come sembra'],
      VoiceCommand.howLongToDry: ['quanto tempo', 'tempo di asciugatura', 'quando è pronto'],
      VoiceCommand.whatWentWrong: ['cosa è andato storto', 'problema', 'errore', 'perché è successo'],
    },
    'pt': {
      VoiceCommand.next: ['próximo', 'próximo passo', 'continuar', 'avançar', 'seguir'],
      VoiceCommand.repeat: ['repetir', 'repita', 'de novo', 'outra vez', 'mais uma vez'],
      VoiceCommand.help: ['ajuda', 'onde estou', 'que etapa', 'o que faço'],
      VoiceCommand.diagnose: ['diagnosticar', 'verificar', 'olha isso', 'como parece'],
      VoiceCommand.howLongToDry: ['quanto tempo', 'tempo de secagem', 'quando fica pronto'],
      VoiceCommand.whatWentWrong: ['o que deu errado', 'problema', 'erro', 'por que aconteceu'],
    },
  };

  /// Fallback to English patterns
  static Map<VoiceCommand, List<String>> patternsForLocale(String languageCode) {
    return localizedPatterns[languageCode] ?? localizedPatterns['en']!;
  }
}
