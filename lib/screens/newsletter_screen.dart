import 'package:flutter/material.dart';
import 'package:nrc_app/widgets/app_header.dart';
import 'package:nrc_app/widgets/newsletter_subscription.dart';
import 'package:nrc_app/services/newsletter_service.dart';
import 'package:nrc_app/l10n/app_localizations.dart';

class NewsletterScreen extends StatefulWidget {
  static const String routeName = '/newsletter';
  
  const NewsletterScreen({Key? key}) : super(key: key);

  @override
  State<NewsletterScreen> createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {
  List<String> _subscribedEmails = [];

  @override
  void initState() {
    super.initState();
    _loadSubscribedEmails();
  }

  Future<void> _loadSubscribedEmails() async {
    final emails = await NewsletterService.getSubscribedEmails();
    setState(() {
      _subscribedEmails = emails;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.newsletter,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.mail_outline,
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    appLocalizations.subscribeToNewsletter,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    appLocalizations.getLatestUpdates,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Subscription widget
            NewsletterSubscriptionWidget(
              onSubscriptionSuccess: () {
                _loadSubscribedEmails();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(appLocalizations.subscriptionSuccessful),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            
            // Benefits section
            Text(
              'Why subscribe?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildBenefitItem(
              icon: Icons.star_outline,
              title: 'Exclusive Offers',
              description: 'Get special discounts and early access to new products',
            ),
            const SizedBox(height: 12),
            _buildBenefitItem(
              icon: Icons.notifications_outlined,
              title: 'Latest News',
              description: 'Stay updated with retro computing news and trends',
            ),
            const SizedBox(height: 12),
            _buildBenefitItem(
              icon: Icons.card_giftcard_outlined,
              title: 'Monthly Giveaways',
              description: 'Enter exclusive raffles for rare retro computers',
            ),
            const SizedBox(height: 12),
            _buildBenefitItem(
              icon: Icons.people_outline,
              title: 'Community Updates',
              description: 'Hear about community events and meetups',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
