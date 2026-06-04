import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleKey = 'app_locale';

const supportedLocales = [
  Locale('en'),
  Locale('fr'),
  Locale('de'),
  Locale('es'),
  Locale('ja'),
  Locale('tr'),
  Locale('az'),
  Locale('ru'),
  Locale('it'),
  Locale('pt'),
];

const localeNativeNames = {
  'en': 'English',
  'fr': 'Français',
  'de': 'Deutsch',
  'es': 'Español',
  'ja': '日本語',
  'tr': 'Türkçe',
  'az': 'Azərbaycan',
  'ru': 'Русский',
  'it': 'Italiano',
  'pt': 'Português',
};

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Must be overridden in ProviderScope');
});

class LocaleNotifier extends StateNotifier<Locale?> {
  final SharedPreferences _prefs;

  LocaleNotifier(this._prefs) : super(null) {
    final code = _prefs.getString(_kLocaleKey);
    if (code != null) {
      state = Locale(code);
    }
  }

  void setLocale(Locale locale) {
    state = locale;
    _prefs.setString(_kLocaleKey, locale.languageCode);
  }

  void clearLocale() {
    state = null;
    _prefs.remove(_kLocaleKey);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocaleNotifier(prefs);
});
