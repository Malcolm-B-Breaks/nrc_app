import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (Locale locale) {
        languageProvider.changeLanguage(locale);
      },
      itemBuilder: (BuildContext context) => [
        _buildPopupMenuItem(context, const Locale('en'), 'English', languageProvider),
        _buildPopupMenuItem(context, const Locale('ja'), '日本語', languageProvider),
        _buildPopupMenuItem(context, const Locale('es'), 'Español', languageProvider),
        _buildPopupMenuItem(context, const Locale('zh', 'CN'), '中文 (普通话)', languageProvider),
        _buildPopupMenuItem(context, const Locale('zh', 'HK'), '中文 (廣東話)', languageProvider),
        _buildPopupMenuItem(context, const Locale('ko'), '한국어', languageProvider),
        _buildPopupMenuItem(context, const Locale('de'), 'Deutsch', languageProvider),
        _buildPopupMenuItem(context, const Locale('fr'), 'Français', languageProvider),
      ],
    );
  }

  PopupMenuItem<Locale> _buildPopupMenuItem(
    BuildContext context, 
    Locale locale, 
    String languageName, 
    LanguageProvider languageProvider,
  ) {
    final isSelected = languageProvider.locale.languageCode == locale.languageCode && 
                      (locale.countryCode == null || 
                       languageProvider.locale.countryCode == locale.countryCode);
                       
    return PopupMenuItem<Locale>(
      value: locale,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(languageName),
          if (isSelected) 
            const Icon(Icons.check, color: Colors.green),
        ],
      ),
    );
  }
} 