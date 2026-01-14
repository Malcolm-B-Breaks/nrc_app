import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/providers/cart_provider.dart';
import 'package:nrc_app/services/payment_service.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:nrc_app/l10n/app_localizations.dart';
import 'package:nrc_app/widgets/app_header.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  static const String routeName = '/checkout/payment-confirmation';
  
  const PaymentConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<PaymentConfirmationScreen> createState() => _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  bool _isProcessing = false;
  String? _errorMessage;
  
  @override
  Widget build(BuildContext context) {
    final paymentDetails = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final cartProvider = Provider.of<CartProvider>(context);
    final items = cartProvider.items;
    final total = cartProvider.total;
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.confirmOrder,
        showBackButton: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalizations.orderSummary,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...items.map((item) => _buildOrderItem(item)),
                      const Divider(),
                      _buildTotalRow(appLocalizations.subtotal, total),
                      _buildTotalRow(appLocalizations.tax, total * 0.08),
                      _buildTotalRow(appLocalizations.total, total * 1.08, isFinal: true),
                      const SizedBox(height: 24),
                      Text(
                        appLocalizations.paymentMethod,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPaymentMethodInfo(paymentDetails),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              _buildActionButton(context, paymentDetails, total * 1.08),
            ],
          ),
          if (_isProcessing)
            Positioned.fill(
              child: ColoredBox(
                color: const Color(0x80000000),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        appLocalizations.processingPayment,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(dynamic item) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: item.imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(Icons.image, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${appLocalizations.quantity}: ${item.quantity}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isFinal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isFinal ? FontWeight.bold : FontWeight.normal,
              fontSize: isFinal ? 16 : 14,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isFinal ? FontWeight.bold : FontWeight.normal,
              fontSize: isFinal ? 16 : 14,
              color: isFinal ? Theme.of(context).primaryColor : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodInfo(Map<String, dynamic> paymentDetails) {
    final isCard = paymentDetails['paymentMethod'] == 'creditCard';
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isCard ? Icons.credit_card : Icons.account_balance_wallet,
            size: 32,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCard ? appLocalizations.creditCard : 'PayPal',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (isCard && paymentDetails['card'] != null)
                  Text(
                    '${paymentDetails['card']['brand']} ${appLocalizations.endingIn} ${paymentDetails['card']['last4']}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  )
                else if (!isCard)
                  Text(
                    paymentDetails['email'] ?? appLocalizations.paypalAccount,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, Map<String, dynamic> paymentDetails, double total) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isProcessing ? null : () => _processPayment(context, paymentDetails, total),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            appLocalizations.placeOrder,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _processPayment(BuildContext context, Map<String, dynamic> paymentDetails, double total) async {
    setState(() {
      _isProcessing = true;
      _errorMessage = null;
    });

    try {
      // Convert amount to cents for Stripe
      final amountInCents = (total * 100).round();
      
      Map<String, dynamic> result;
      
      if (paymentDetails['paymentMethod'] == 'creditCard') {
        // Process payment with Stripe
        result = await PaymentService.makePayment(
          amount: amountInCents,
          currency: 'usd',
        );
      } else {
        // PayPal payment is already processed in the PayPal screen
        result = {'success': true};
      }

      if (result['success'] == true) {
        // Clear cart after successful payment
        Provider.of<CartProvider>(context, listen: false).clearCart();
        
        // Navigate to success page or show success dialog
        if (mounted) {
          _showSuccessDialog(context);
        }
      } else {
        setState(() {
          _errorMessage = result['error'] ?? 'Payment failed. Please try again.';
          _isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
        _isProcessing = false;
      });
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Payment Successful'),
        content: const Text('Your order has been placed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              // Navigate back to home or orders screen
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
} 