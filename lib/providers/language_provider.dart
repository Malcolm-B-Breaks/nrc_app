import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageCodeKey = 'languageCode';
  static const String _countryCodeKey = 'countryCode';
  
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;
  
  LanguageProvider() {
    _loadSavedLanguage();
  }
  
  // Load the saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageCodeKey);
    final countryCode = prefs.getString(_countryCodeKey);
    
    if (languageCode != null) {
      _locale = Locale(languageCode, countryCode);
      notifyListeners();
    }
  }
  
  // Change the app language
  Future<void> changeLanguage(Locale locale) async {
    // Check if the locale is supported
    if (!AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }
    
    _locale = locale;
    
    // Save the selected language
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
    if (locale.countryCode != null) {
      await prefs.setString(_countryCodeKey, locale.countryCode!);
    } else {
      await prefs.remove(_countryCodeKey);
    }
    
    notifyListeners();
  }
  
  // Get the display name of the current language
  String getCurrentLanguageName(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    switch (_locale.languageCode) {
      case 'en':
        return localizations.english;
      case 'ja':
        return localizations.japanese;
      case 'es':
        return localizations.spanish;
      case 'zh':
        if (_locale.countryCode == 'CN') {
          return localizations.mandarin;
        } else if (_locale.countryCode == 'HK') {
          return localizations.cantonese;
        }
        return localizations.mandarin;
      case 'ko':
        return localizations.korean;
      case 'de':
        return localizations.german;
      case 'fr':
        return localizations.french;
      default:
        return localizations.english;
    }
  }
} 