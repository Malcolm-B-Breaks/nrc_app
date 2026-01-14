import 'package:flutter/material.dart';
import 'package:nrc_app/l10n/app_localizations.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:nrc_app/widgets/app_header.dart';

/// A screen that allows users to contact the company through various methods.
class ContactScreen extends StatefulWidget {
  /// Creates a new instance of [ContactScreen].
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;
  late final AppLocalizations _appLocalizations;

  @override
  void initState() {
    super.initState();
    _appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: _appLocalizations.contactUs,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _appLocalizations.contactDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            
            // Contact form
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      labelText: _appLocalizations.subject,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return _appLocalizations.fieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: _appLocalizations.message,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return _appLocalizations.fieldRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isSending ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isSending
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(_appLocalizations.sendMessage),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Contact methods
            Text(
              _appLocalizations.contactMethods,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildContactMethod(
              context,
              icon: Icons.email,
              title: _appLocalizations.supportEmail,
              subtitle: 'support@nrc.com',
              onTap: () {
                // Open email client
              },
            ),
            _buildContactMethod(
              context,
              icon: Icons.discord,
              title: _appLocalizations.discordServer,
              subtitle: 'Join our Discord community',
              onTap: () {
                // Open Discord
              },
            ),
            _buildContactMethod(
              context,
              icon: Icons.chat_bubble_outline,
              title: _appLocalizations.twitter,
              subtitle: '@NRC_Official',
              onTap: () {
                // Open Twitter
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactMethod(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, size: 32),
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
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isSending = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_appLocalizations.messageSentSuccessfully),
          duration: const Duration(seconds: 2),
        ),
      );

      // Clear form
      _subjectController.clear();
      _messageController.clear();
    }
  }
} 