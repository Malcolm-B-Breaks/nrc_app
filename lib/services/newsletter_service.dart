import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NewsletterService {
  static const String _subscribedEmailsKey = 'newsletter_subscribed_emails';
  
  /// Subscribe an email to the newsletter
  /// In production, this would call a backend API
  static Future<Map<String, dynamic>> subscribe(String email) async {
    try {
      // Validate email format
      if (!_isValidEmail(email)) {
        return {
          'success': false,
          'error': 'invalidEmailForNewsletter',
        };
      }

      final prefs = await SharedPreferences.getInstance();
      
      // Get currently subscribed emails
      final subscribedEmails = prefs.getStringList(_subscribedEmailsKey) ?? [];
      
      // Check if already subscribed
      if (subscribedEmails.contains(email)) {
        return {
          'success': false,
          'error': 'emailAlreadySubscribed',
        };
      }

      // Add email to subscribed list
      subscribedEmails.add(email);
      await prefs.setStringList(_subscribedEmailsKey, subscribedEmails);

      // In production, you would call your backend API here:
      // final response = await http.post(
      //   Uri.parse('https://your-api.com/newsletter/subscribe'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode({'email': email}),
      // );
      // 
      // if (response.statusCode == 200) {
      //   return {'success': true};
      // } else {
      //   return {'success': false, 'error': 'subscriptionFailed'};
      // }

      return {
        'success': true,
        'message': 'subscriptionSuccessful',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'subscriptionFailed',
      };
    }
  }

  /// Unsubscribe an email from the newsletter
  static Future<bool> unsubscribe(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final subscribedEmails = prefs.getStringList(_subscribedEmailsKey) ?? [];
      
      subscribedEmails.remove(email);
      await prefs.setStringList(_subscribedEmailsKey, subscribedEmails);
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if an email is subscribed
  static Future<bool> isSubscribed(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final subscribedEmails = prefs.getStringList(_subscribedEmailsKey) ?? [];
      return subscribedEmails.contains(email);
    } catch (e) {
      return false;
    }
  }

  /// Get all subscribed emails (for demo purposes)
  static Future<List<String>> getSubscribedEmails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(_subscribedEmailsKey) ?? [];
    } catch (e) {
      return [];
    }
  }

  /// Validate email format
  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
