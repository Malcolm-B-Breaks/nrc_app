import 'package:flutter/material.dart';
import 'package:nrc_app/services/newsletter_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsletterSubscriptionWidget extends StatefulWidget {
  final VoidCallback? onSubscriptionSuccess;
  
  const NewsletterSubscriptionWidget({
    Key? key,
    this.onSubscriptionSuccess,
  }) : super(key: key);

  @override
  State<NewsletterSubscriptionWidget> createState() => _NewsletterSubscriptionWidgetState();
}

class _NewsletterSubscriptionWidgetState extends State<NewsletterSubscriptionWidget> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _successMessage;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubscribe() async {
    final email = _emailController.text.trim();
    
    if (email.isEmpty) {
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.pleaseEnterEmail;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      final result = await NewsletterService.subscribe(email);
      
      if (result['success'] == true) {
        setState(() {
          _isLoading = false;
          _successMessage = AppLocalizations.of(context)!.subscriptionSuccessful;
          _errorMessage = null;
          _emailController.clear();
        });
        
        widget.onSubscriptionSuccess?.call();
        
        // Auto-dismiss success message after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _successMessage = null;
            });
          }
        });
      } else {
        final errorKey = result['error'] ?? 'subscriptionFailed';
        String errorMessage;
        
        switch (errorKey) {
          case 'emailAlreadySubscribed':
            errorMessage = AppLocalizations.of(context)!.emailAlreadySubscribed;
            break;
          case 'invalidEmailForNewsletter':
            errorMessage = AppLocalizations.of(context)!.invalidEmailForNewsletter;
            break;
          default:
            errorMessage = AppLocalizations.of(context)!.subscriptionFailed;
        }
        
        setState(() {
          _isLoading = false;
          _errorMessage = errorMessage;
          _successMessage = null;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = AppLocalizations.of(context)!.subscriptionFailed;
        _successMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            appLocalizations.subscribeToNewsletter,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          
          // Description
          Text(
            appLocalizations.getLatestUpdates,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          
          // Email input and subscribe button
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _emailController,
                  enabled: !_isLoading,
                  decoration: InputDecoration(
                    hintText: appLocalizations.enterEmailToSubscribe,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleSubscribe,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(appLocalizations.subscribe),
                ),
              ),
            ],
          ),
          
          // Error message
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          
          // Success message
          if (_successMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _successMessage!,
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 13,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
