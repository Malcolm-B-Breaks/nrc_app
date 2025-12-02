import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/models/product.dart';
import 'package:nrc_app/providers/cart_provider.dart';
import 'package:nrc_app/providers/product_provider.dart';
import 'package:nrc_app/utils/dummy_image.dart';
import 'package:nrc_app/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nrc_app/utils/routes.dart';
import 'package:nrc_app/widgets/app_header.dart';

/// A screen that displays a list of products with filtering and sorting options.
class ProductScreen extends StatelessWidget {
  /// Creates a new instance of [ProductScreen].
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.products,
        showBackButton: true,
      ),
      body: Column(
        children: [
          // Search and filter bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: appLocalizations.search,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    // Show filter dialog
                  },
                  icon: const Icon(Icons.filter_list),
                  tooltip: appLocalizations.filter,
                ),
                IconButton(
                  onPressed: () {
                    // Show sort dialog
                  },
                  icon: const Icon(Icons.sort),
                  tooltip: appLocalizations.sortBy,
                ),
              ],
            ),
          ),
          
          // Products grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 10, // Replace with actual product count
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image
                      Expanded(
                        child: Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(
                              Icons.computer,
                              size: 48,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      // Product info
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${(99.99 + index).toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add to cart
                                },
                                child: Text(appLocalizations.addToCart),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 