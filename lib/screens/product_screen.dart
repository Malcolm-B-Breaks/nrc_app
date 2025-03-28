import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nrc_app/models/product.dart';
import 'package:nrc_app/providers/cart_provider.dart';
import 'package:nrc_app/providers/product_provider.dart';
import 'package:nrc_app/utils/dummy_image.dart';
import 'package:nrc_app/widgets/app_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 1;
  bool _isLoading = true;
  String? _error;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get product ID from route arguments
    final productId = ModalRoute.of(context)?.settings.arguments as String?;
    if (productId != null) {
      _loadProduct(productId);
    } else {
      setState(() {
        _error = 'Product not found';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadProduct(String productId) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await Provider.of<ProductProvider>(context, listen: false)
          .loadProductById(productId);
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  Future<void> _addToCart(Product product) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    await cartProvider.addItem(product, quantity: _quantity);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.name} added to cart'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'View Cart',
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.selectedProduct;

    if (_isLoading) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Product Details'),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null || product == null) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Product Details'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text(_error ?? 'Product not found'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product image
            AspectRatio(
              aspectRatio: 1,
              child: product.images.isNotEmpty
                  ? Image.asset(
                      product.images.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return PlaceholderImageHelper.buildPlaceholderImage(
                          product.name,
                          double.infinity,
                          double.infinity,
                        );
                      },
                    )
                  : PlaceholderImageHelper.buildPlaceholderImage(
                      product.name,
                      double.infinity,
                      double.infinity,
                    ),
            ),
            
            // Product details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: product.stock > 0
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          product.stock > 0
                              ? 'In Stock: ${product.stock}'
                              : 'Out of Stock',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Specifications
                  ...product.specifications.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              '${entry.key}:',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(entry.value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Quantity selector and Add to Cart
                  if (product.stock > 0)
                    Row(
                      children: [
                        const Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: _decrementQuantity,
                                splashRadius: 20,
                              ),
                              Text(
                                '$_quantity',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: _incrementQuantity,
                                splashRadius: 20,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Consumer<CartProvider>(
                          builder: (_, cartProvider, __) => ElevatedButton(
                            onPressed: cartProvider.isLoading
                                ? null
                                : () => _addToCart(product),
                            child: cartProvider.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Add to Cart'),
                          ),
                        ),
                      ],
                    )
                  else
                    const Text(
                      'This product is currently out of stock',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 