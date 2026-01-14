import 'package:flutter/material.dart';
import 'package:nrc_app/l10n/app_localizations.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:nrc_app/widgets/app_header.dart';

/// A screen that displays and allows editing of the user's profile information.
class ProfileScreen extends StatelessWidget {
  /// Creates a new instance of [ProfileScreen].
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.profile,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'John Doe', // Replace with actual user name
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'john.doe@example.com', // Replace with actual user email
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Personal Information section
            Text(
              appLocalizations.personalInformation,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoField(
              context,
              label: appLocalizations.name,
              value: 'John Doe',
            ),
            _buildInfoField(
              context,
              label: appLocalizations.email,
              value: 'john.doe@example.com',
            ),
            _buildInfoField(
              context,
              label: appLocalizations.phoneNumber,
              value: '+1 (555) 123-4567',
            ),
            _buildInfoField(
              context,
              label: appLocalizations.address,
              value: '123 Main St, City, Country',
            ),
            const SizedBox(height: 32),
            
            // Social Media section
            Text(
              appLocalizations.socialMedia,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSocialMediaButton(
              context,
              icon: Icons.discord,
              label: appLocalizations.discord,
              onTap: () {
                // Open Discord
              },
            ),
            _buildSocialMediaButton(
              context,
              icon: Icons.chat_bubble_outline,
              label: appLocalizations.twitter,
              onTap: () {
                // Open Twitter
              },
            ),
            _buildSocialMediaButton(
              context,
              icon: Icons.code,
              label: appLocalizations.github,
              onTap: () {
                // Open GitHub
              },
            ),
            const SizedBox(height: 32),
            
            // Settings section
            Text(
              appLocalizations.settings,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsButton(
              context,
              icon: Icons.language,
              label: appLocalizations.language,
              onTap: () {
                // Show language selector
              },
            ),
            _buildSettingsButton(
              context,
              icon: Icons.notifications,
              label: appLocalizations.notifications,
              onTap: () {
                // Show notification settings
              },
            ),
            _buildSettingsButton(
              context,
              icon: Icons.dark_mode,
              label: appLocalizations.darkMode,
              onTap: () {
                // Toggle dark mode
              },
            ),
            const SizedBox(height: 32),
            
            // Danger zone
            Text(
              'Danger Zone',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Show delete account confirmation
                },
                icon: const Icon(Icons.delete_forever),
                label: Text(appLocalizations.deleteAccount),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(BuildContext context, {
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton(BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
} 