import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('ja', ''), // Japanese
    Locale('es', ''), // Spanish
    Locale('zh', 'CN'), // Simplified Chinese (Mandarin)
    Locale('zh', 'HK'), // Cantonese
    Locale('ko', ''), // Korean
    Locale('de', ''), // German
    Locale('fr', ''), // French
  ];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) {
      return supportedLocales.first;
    }
    
    // Check if the current device locale is supported
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        // For Chinese, check the script code as well
        if (locale.languageCode == 'zh') {
          if (supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        } else {
          return supportedLocale;
        }
      }
    }
    
    // If the device locale is not supported, use English
    return supportedLocales.first;
  }
}

// This class will be the entry point for all generated localization strings
class L10n {
  static Locale? _locale;
  static Locale get locale => _locale ?? AppLocalizations.supportedLocales.first;
  
  static set locale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) {
      _locale = newLocale;
    }
  }
  
  // This will be replaced by the generated code
  static const Map<String, Map<String, String>> _localizedValues = {};
  
  static String get(String key) {
    try {
      final languageCode = locale.languageCode;
      // For Chinese, use the specific script
      if (languageCode == 'zh' && locale.countryCode != null) {
        final scriptCode = locale.countryCode!;
        return _localizedValues['${languageCode}_$scriptCode']?[key] ?? 
               _localizedValues['en']?[key] ?? 
               key;
      }
      return _localizedValues[languageCode]?[key] ?? 
             _localizedValues['en']?[key] ?? 
             key;
    } catch (e) {
      return key;
    }
  }
} 