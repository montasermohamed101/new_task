import 'package:flutter/material.dart';

import 'app_localization.dart';

class LocalizationService {
  static const Locale arabic = Locale('ar');
  static const Locale english = Locale('en');

  static final Map<Locale, Map<String, dynamic>> _localizedValues = {
    arabic: AppLocalizations.ar,
    english: AppLocalizations.en,
  };

  Locale _locale = arabic; // Default to Arabic

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_localizedValues.containsKey(locale)) {
      _locale = locale;
    }
  }

  String translate(String key) {
    return _localizedValues[_locale]?[key] ?? key; // Fallback to key if translation not found
  }
}