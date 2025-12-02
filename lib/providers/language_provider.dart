import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;
  
  LanguageProvider() {
    _loadSavedLanguage();
  }
  
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);
    
    if (languageCode != null) {
      // Check if it's a language with a country code
      if (languageCode.contains('_')) {
        final parts = languageCode.split('_');
        _locale = Locale(parts[0], parts[1]);
      } else {
        _locale = Locale(languageCode);
      }
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    _locale = locale;
    
    final prefs = await SharedPreferences.getInstance();
    if (locale.countryCode != null) {
      await prefs.setString(_languageKey, '${locale.languageCode}_${locale.countryCode}');
    } else {
      await prefs.setString(_languageKey, locale.languageCode);
    }
    
    notifyListeners();
  }
  
  String getLanguageDisplayName(BuildContext context) {
    switch (_locale.languageCode) {
      case 'en':
        return 'English';
      case 'ja':
        return '日本語';
      case 'es':
        return 'Español';
      case 'zh':
        if (_locale.countryCode == 'CN') {
          return '中文 (普通话)';
        } else if (_locale.countryCode == 'HK') {
          return '中文 (廣東話)';
        }
        return '中文';
      case 'ko':
        return '한국어';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'Français';
      default:
        return 'English';
    }
  }
} 