import 'package:flutter/material.dart';
import '../utils/routes.dart';
import 'language_selector.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? additionalActions;
  
  const AppHeader({
    Key? key,
    this.title = 'NRC',
    this.showBackButton = false,
    this.additionalActions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.splash),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.computer, size: 24),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
      centerTitle: true,
      leading: showBackButton 
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: [
        ...(additionalActions ?? []),
        const LanguageSelector(),
        const SizedBox(width: 8),
      ],
    );
  }
} 