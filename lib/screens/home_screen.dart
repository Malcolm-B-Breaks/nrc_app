import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/providers/product_provider.dart';
import 'package:nrc_app/widgets/app_drawer.dart';
import 'package:nrc_app/widgets/app_bar.dart';
import 'package:nrc_app/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

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
    final productProvider = Provider.of<ProductProvider>(context);
    final isLoading = productProvider.isLoading;
    final products = productProvider.filteredProducts;
    final categories = productProvider.categories;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Category filter
                Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = category == _selectedCategory;
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = category;
                            });
                            productProvider.filterByCategory(
                              category == 'All' ? '' : category,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                
                // Featured section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Products',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          // View all products
                        },
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                ),
                
                // Products grid
                Expanded(
                  child: products.isEmpty
                      ? const Center(child: Text('No products found'))
                      : GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: products[index]);
                          },
                        ),
                ),
              ],
            ),
    );
  }
} 