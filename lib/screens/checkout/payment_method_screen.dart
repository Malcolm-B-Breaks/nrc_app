import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/providers/cart_provider.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nrc_app/widgets/app_header.dart';

enum PaymentMethod { creditCard, paypal }

class PaymentMethodScreen extends StatelessWidget {
  static const String routeName = '/checkout/payment-method';
  
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final total = cartProvider.total;
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.selectPaymentMethod,
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.choosePaymentMethod,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildPaymentOption(
                    context,
                    title: appLocalizations.creditCard,
                    subtitle: appLocalizations.payWithCreditCard,
                    icon: Icons.credit_card,
                    method: PaymentMethod.creditCard,
                  ),
                  const SizedBox(height: 16),
                  _buildPaymentOption(
                    context,
                    title: appLocalizations.paypal,
                    subtitle: appLocalizations.payWithPaypal,
                    icon: Icons.account_balance_wallet,
                    method: PaymentMethod.paypal,
                  ),
                ],
              ),
            ),
          ),
          _buildOrderSummary(context, total),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required PaymentMethod method,
  }) {
    return InkWell(
      onTap: () => _handlePaymentMethodSelection(context, method),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, double total) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${appLocalizations.total}:',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handlePaymentMethodSelection(BuildContext context, PaymentMethod method) {
    switch (method) {
      case PaymentMethod.creditCard:
        Navigator.pushNamed(context, AppRoutes.cardPayment);
        break;
      case PaymentMethod.paypal:
        Navigator.pushNamed(context, AppRoutes.paypalPayment);
        break;
    }
  }
} 