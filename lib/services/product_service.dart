import 'package:nrc_app/models/product.dart';

class ProductService {
  // Dummy products data for the app
  List<Product> getDummyProducts() {
    return [
      Product(
        id: '1',
        name: 'Sharp MZ-700',
        description: 'The Sharp MZ-700 was released in 1982 without a built-in standard character set, which allowed developers more flexibility in displaying custom characters on the screen. The MZ-700 was functionally similar to the older MZ-80K but with better graphics capabilities and keyboard.',
        price: 289.99,
        images: ['assets/images/placeholder.png'],
        category: 'Computer',
        stock: 5,
        specifications: {
          'CPU': 'Sharp LH0080A Z80A-compatible',
          'Memory': '64K RAM',
          'Display': '40x25 text, 80x50 graphics',
          'Year': '1982',
          'Color': 'Beige',
          'Shipping': 'Free'
        },
        relatedProducts: ['2', '3', '4'],
      ),
      Product(
        id: '2',
        name: 'NEC PC-8801',
        description: 'The NEC PC-8801 series was a popular 8-bit personal computer in Japan during the 1980s. Known for its powerful graphics capabilities, it was widely used for gaming and business applications.',
        price: 349.99,
        images: ['assets/images/placeholder.png'],
        category: 'Computer',
        stock: 3,
        specifications: {
          'CPU': 'NEC μPD780C (Z80A-compatible)',
          'Memory': '64K RAM',
          'Display': '80x25 text, 640x200 graphics',
          'Year': '1981',
          'Color': 'Gray',
          'Shipping': 'Free'
        },
        relatedProducts: ['1', '3', '5'],
      ),
      Product(
        id: '3',
        name: 'Fujitsu FM-7',
        description: 'The Fujitsu FM-7 was a home computer released in 1982, featuring advanced graphics capabilities and a robust BASIC interpreter. It was one of the early Japanese computers to support color graphics natively.',
        price: 279.99,
        images: ['assets/images/placeholder.png'],
        category: 'Computer',
        stock: 2,
        specifications: {
          'CPU': 'Motorola 6809 @ 1MHz',
          'Memory': '64K RAM',
          'Display': '80x25 text, 640x200 graphics',
          'Year': '1982',
          'Color': 'Red/White',
          'Shipping': 'Free'
        },
        relatedProducts: ['1', '2', '4'],
      ),
      Product(
        id: '4',
        name: 'MSX Standard Keyboard',
        description: 'A high-quality mechanical keyboard designed to provide an authentic typing experience for retro computer enthusiasts. Compatible with most MSX systems.',
        price: 89.99,
        images: ['assets/images/placeholder.png'],
        category: 'Accessory',
        stock: 10,
        specifications: {
          'Type': 'Mechanical',
          'Layout': 'MSX Standard',
          'Connection': 'DIN',
          'Color': 'Beige',
          'Shipping': 'Free'
        },
        relatedProducts: ['5', '6'],
      ),
      Product(
        id: '5',
        name: 'Retro Computer Mouse',
        description: 'A classic ball mouse with the look and feel of early computing peripherals, but with modern internals for reliable operation.',
        price: 39.99,
        images: ['assets/images/placeholder.png'],
        category: 'Accessory',
        stock: 15,
        specifications: {
          'Type': 'Ball Mouse',
          'Connection': 'Serial/PS2 Adapter',
          'Color': 'Beige',
          'Shipping': 'Free'
        },
        relatedProducts: ['4', '6'],
      ),
      Product(
        id: '6',
        name: 'Retro Computing Software Collection',
        description: 'A curated collection of classic software titles, games, and utilities for your retro computer. Available on various disk formats.',
        price: 49.99,
        images: ['assets/images/placeholder.png'],
        category: 'Software',
        stock: 8,
        specifications: {
          'Format': 'Floppy Disk',
          'Compatibility': 'Multiple Systems',
          'Contents': '20+ Applications',
          'Shipping': 'Free'
        },
        relatedProducts: ['1', '2', '3'],
      ),
    ];
  }

  // Get all products
  Future<List<Product>> getAllProducts() async {
    // In a real app, this would fetch from an API
    return Future.delayed(
      const Duration(milliseconds: 800),
      () => getDummyProducts(),
    );
  }

  // Get product by ID
  Future<Product?> getProductById(String id) async {
    // In a real app, this would fetch from an API
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => getDummyProducts().firstWhere(
        (product) => product.id == id,
        orElse: () => throw Exception('Product not found'),
      ),
    );
  }

  // Get products by category
  Future<List<Product>> getProductsByCategory(String category) async {
    // In a real app, this would fetch from an API
    return Future.delayed(
      const Duration(milliseconds: 700),
      () => getDummyProducts()
          .where((product) => product.category == category)
          .toList(),
    );
  }

  // Search products
  Future<List<Product>> searchProducts(String query) async {
    // In a real app, this would use a search API
    final lowerQuery = query.toLowerCase();
    return Future.delayed(
      const Duration(milliseconds: 600),
      () => getDummyProducts()
          .where((product) =>
              product.name.toLowerCase().contains(lowerQuery) ||
              product.description.toLowerCase().contains(lowerQuery))
          .toList(),
    );
  }
} 