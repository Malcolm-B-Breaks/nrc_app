import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/providers/product_provider.dart';
import 'package:nrc_app/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load products when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nihon Retro Computers'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.computer,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            Text(
              'Nihon Retro Computers',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'Your destination for retro computing',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Simple action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Welcome to NRC App!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Browse Products'),
            ),
          ],
        ),
      ),
    );
  }
} 