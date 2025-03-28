import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:http/http.dart' as http;

class PaymentService {
  // Get Stripe publishable key from environment
  static String? get publishableKey => dotenv.env['STRIPE_PUBLISHABLE_KEY'];
  static String? get secretKey => dotenv.env['STRIPE_SECRET_KEY'];

  // Initialize Stripe
  static Future<void> initialize() async {
    if (publishableKey != null) {
      Stripe.publishableKey = publishableKey!;
      await Stripe.instance.applySettings();
    }
  }

  // Make payment for a given amount in USD cents
  static Future<Map<String, dynamic>> makePayment({
    required int amount,
    required String currency,
  }) async {
    try {
      // Step 1: Create payment intent
      final paymentIntentResult = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );

      if (paymentIntentResult['error'] != null) {
        return {
          'success': false,
          'error': paymentIntentResult['error'],
        };
      }

      // Step 2: Initialize payment sheet
      await _initializePaymentSheet(
        paymentIntentClientSecret: paymentIntentResult['clientSecret'],
      );

      // Step 3: Present payment sheet
      final result = await _presentPaymentSheet();
      
      return result;
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // Create a payment intent on the server or locally
  static Future<Map<String, dynamic>> _createPaymentIntent({
    required int amount,
    required String currency,
  }) async {
    try {
      // In production, you would create the payment intent on your server
      // For demo purposes, we're creating it directly (not recommended for production)
      if (secretKey == null) {
        return {
          'success': false,
          'error': 'Stripe secret key not found',
        };
      }

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': amount.toString(),
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );

      final jsonResponse = jsonDecode(response.body);
      
      if (jsonResponse['error'] != null) {
        return {
          'success': false,
          'error': jsonResponse['error']['message'],
        };
      }

      return {
        'success': true,
        'clientSecret': jsonResponse['client_secret'],
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // Initialize the payment sheet
  static Future<void> _initializePaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'NRC App',
        paymentIntentClientSecret: paymentIntentClientSecret,
        style: ThemeMode.light,
        appearance: const PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            primary: Color(0xFF0553B1),
          ),
        ),
      ),
    );
  }

  // Present the payment sheet to the user
  static Future<Map<String, dynamic>> _presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      
      return {
        'success': true,
        'message': 'Payment completed successfully',
      };
    } on StripeException catch (e) {
      return {
        'success': false,
        'error': e.error.localizedMessage,
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
} 