/// Per-language phrase sets for the hands-free voice loop: how to end a
/// conversation and how to wake Doro up. Latin-script languages share the
/// English wake variants (the recognizer usually hears "hey doro" the same
/// way), extended with native interjections.
library;

const Set<String> _baseWakePhrases = {
  'hey doro',
  'hey dora',
  'hey duro',
  'hey dodo',
  'hey dorough',
  'okay doro',
  'ok doro',
  'ok dora',
};

const Map<String, Set<String>> _wakeExtras = {
  'az': {'salam doro', 'ey doro'},
  'de': {'he doro', 'hallo doro'},
  'es': {'oye doro', 'hola doro'},
  'fr': {'hé doro', 'salut doro', 'eh doro'},
  'it': {'ehi doro', 'ciao doro'},
  'ja': {'ヘイドロ', 'ヘイ ドロ', 'ヘイ、ドロ', 'ねえドロ', 'ねえ、ドロ', 'ヘイトロ'},
  'pt': {'ei doro', 'oi doro'},
  'ru': {'хей доро', 'эй доро', 'привет доро', 'хэй доро'},
  'tr': {'hey doro', 'selam doro'},
};

const Map<String, Set<String>> _stopPhrases = {
  'en': {
    'stop', 'stop listening', "that's all", 'thats all', 'that is all',
    'goodbye', 'bye', 'exit', 'quit', 'end conversation', "i'm done",
    'im done', 'done', 'no thanks', 'nothing else',
  },
  'az': {
    'dayan', 'bəsdir', 'bu qədər', 'sağ ol bu qədər', 'çıx', 'bitir',
    'vəssalam', 'bitti', 'təşəkkürlər bu qədər',
  },
  'de': {
    'stopp', 'stop', 'das ist alles', 'das wars', "das war's", 'tschüss',
    'beenden', 'fertig', 'danke das wars', 'nichts mehr',
  },
  'es': {
    'para', 'alto', 'basta', 'eso es todo', 'adiós', 'adios', 'salir',
    'terminar', 'listo', 'ya está', 'ya esta', 'nada más', 'nada mas',
  },
  'fr': {
    'stop', 'arrête', 'arrete', 'arrêter', "c'est tout", 'cest tout',
    'au revoir', 'terminer', 'fini', "j'ai fini", 'merci c est tout',
  },
  'it': {
    'stop', 'fermati', 'basta', 'è tutto', 'e tutto', 'ciao', 'esci',
    'finito', 'ho finito', 'nient altro',
  },
  'ja': {
    'ストップ', 'やめて', '終わり', 'おわり', '以上', 'さようなら',
    'もういい', '終了', 'ありがとう以上',
  },
  'pt': {
    'para', 'pare', 'chega', 'é tudo', 'e tudo', 'tchau', 'sair',
    'terminar', 'pronto', 'acabei', 'mais nada',
  },
  'ru': {
    'стоп', 'хватит', 'это всё', 'это все', 'пока', 'выход', 'закончить',
    'всё', 'все', 'я закончил', 'я закончила', 'больше ничего',
  },
  'tr': {
    'dur', 'yeter', 'bu kadar', 'hoşça kal', 'hoscakal', 'çık', 'bitir',
    'tamam bu kadar', 'bitti', 'başka bir şey yok',
  },
};

/// Wake phrases for [languageCode]: the shared latin set plus any
/// language-specific variants.
Set<String> wakePhrasesFor(String languageCode) => {
      ..._baseWakePhrases,
      ...?_wakeExtras[languageCode],
    };

/// Stop phrases for [languageCode]. 'stop' is understood everywhere.
Set<String> stopPhrasesFor(String languageCode) => {
      'stop',
      ...?_stopPhrases[languageCode],
      // English phrases always work as a fallback.
      ..._stopPhrases['en']!,
    };

/// Languages with voice phrase coverage (mirrors the app's locales).
const List<String> voiceSupportedLanguages = [
  'en', 'az', 'de', 'es', 'fr', 'it', 'ja', 'pt', 'ru', 'tr',
];
