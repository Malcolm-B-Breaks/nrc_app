import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/providers/auth_provider.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:nrc_app/widgets/app_bar.dart';
import 'package:nrc_app/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    // Redirect to login if not authenticated
    if (!user.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'My Profile'),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            // Profile avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  user.name.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user.email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            // Profile sections
            const ProfileSection(
              title: 'Account Settings',
              icon: Icons.settings,
              items: [
                ProfileMenuItem(
                  title: 'Edit Profile',
                  icon: Icons.edit,
                ),
                ProfileMenuItem(
                  title: 'Change Password',
                  icon: Icons.lock_outline,
                ),
                ProfileMenuItem(
                  title: 'Notification Settings',
                  icon: Icons.notifications_none,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ProfileSection(
              title: 'Orders',
              icon: Icons.shopping_bag_outlined,
              items: [
                ProfileMenuItem(
                  title: 'Order History',
                  icon: Icons.history,
                ),
                ProfileMenuItem(
                  title: 'Track Order',
                  icon: Icons.local_shipping_outlined,
                ),
                ProfileMenuItem(
                  title: 'Returns',
                  icon: Icons.assignment_return_outlined,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ProfileSection(
              title: 'Other',
              icon: Icons.more_horiz,
              items: [
                ProfileMenuItem(
                  title: 'Wishlist',
                  icon: Icons.favorite_border,
                ),
                ProfileMenuItem(
                  title: 'Help & Support',
                  icon: Icons.help_outline,
                ),
                ProfileMenuItem(
                  title: 'Terms & Conditions',
                  icon: Icons.description_outlined,
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Logout button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  await authProvider.signOut();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<ProfileMenuItem> items;

  const ProfileSection({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            ...items.map((item) => item),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.zero,
      onTap: onTap ?? () {
        // Default action - show not implemented message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title feature is not implemented yet'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
    );
  }
} 