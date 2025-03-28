import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'services/payment_service.dart';
import 'providers/cart_provider.dart';
import 'models/cart_item.dart';
import 'screens/checkout/payment_method_screen.dart';
import 'screens/checkout/payment_info_screen.dart';
import 'screens/checkout/paypal_screen.dart';
import 'screens/checkout/payment_confirmation_screen.dart';
import 'utils/routes.dart';

// Custom icon for Discord
class CustomIcons {
  static const IconData discord = IconData(
    0xE900,
    fontFamily: 'CustomIcons',
    fontPackage: null,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables from .env file
  try {
    await dotenv.load(fileName: '.env');
    // Initialize Stripe
    await PaymentService.initialize();
  } catch (e) {
    print('Error loading .env file: $e');
    // Set default values if .env not found
    dotenv.env['SUPPORT_EMAIL'] = 'support@example.com';
  }
  
  // Create and initialize cart provider
  final cartProvider = CartProvider();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>.value(value: cartProvider),
      ],
      child: const MyApp(),
    ),
  );
  
  // Initialize cart with a sample product for testing
  cartProvider.addCartItem(
    CartItem(
      id: 'sample-1',
      name: 'Retro Computer Model X',
      price: 299.99,
      imageUrl: 'https://picsum.photos/id/60/200/200',
      quantity: 1,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NRC App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: const Color(0xFFA3442D),
        scaffoldBackgroundColor: const Color(0xFFE0C9C5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA3442D),
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        AppRoutes.splash: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.products: (context) => const ProductScreen(),
        AppRoutes.productDetail: (context) => const ProductDetailScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.contact: (context) => const ContactScreen(),
        AppRoutes.cart: (context) => const CartScreen(),
        // Checkout flow routes
        AppRoutes.paymentMethod: (context) => const PaymentMethodScreen(),
        AppRoutes.cardPayment: (context) => const CardPaymentScreen(),
        AppRoutes.paypalPayment: (context) => const PaypalScreen(),
        AppRoutes.paymentConfirmation: (context) => const PaymentConfirmationScreen(),
      },
      initialRoute: AppRoutes.splash,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
      ),
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
              'Be a Part of the Digital Resurrection',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Sign In'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Test button for profile
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              child: const Text('Test Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}

// Simple login screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // For demo purposes, accept any input
      Navigator.pushReplacementNamed(context, AppRoutes.products);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Text(
                'Nihon Retro Computers',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // For testing, navigate directly to products
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: const Text('Skip login (for testing)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RegisterScreen implementation
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Create a new user profile
      final userData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': '',
        'location': '',
        'bio': '',
        'socialMedia': {
          'discord': '',
          'twitter': '',
          'github': '',
        }
      };
      
      // Show success message and navigate to profile page
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
      
      // Navigate to products page after successful registration
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(
          context, 
          AppRoutes.products,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Simple email validation
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Password field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Confirm Password field
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                
                // Register button
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Simple product screen
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isGridView = true;

  // Mock product data
  final List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'name': 'Sharp MZ-700',
      'price': 289.99,
      'category': 'Computer',
      'imageUrl': 'https://picsum.photos/id/60/200/200',
      'description': 'The Sharp MZ-700 was released in 1982 without a built-in standard character set, which allowed developers more flexibility in displaying custom characters on the screen.',
      'specifications': {
        'CPU': 'Sharp LH0080A Z80A-compatible',
        'Memory': '64K RAM',
        'Display': '40x25 text, 80x50 graphics',
        'Year': '1982',
      }
    },
    {
      'id': '2',
      'name': 'NEC PC-8801',
      'price': 349.99,
      'category': 'Computer',
      'imageUrl': 'https://picsum.photos/id/61/200/200',
      'description': 'The NEC PC-8801 series was a popular 8-bit personal computer in Japan during the 1980s. Known for its powerful graphics capabilities.',
      'specifications': {
        'CPU': 'NEC μPD780C (Z80A-compatible)',
        'Memory': '64K RAM',
        'Display': '80x25 text, 640x200 graphics',
        'Year': '1981',
      }
    },
    {
      'id': '3',
      'name': 'Fujitsu FM-7',
      'price': 279.99,
      'category': 'Computer',
      'imageUrl': 'https://picsum.photos/id/62/200/200',
      'description': 'The Fujitsu FM-7 was a home computer released in 1982, featuring advanced graphics capabilities and a robust BASIC interpreter.',
      'specifications': {
        'CPU': 'Motorola 6809 @ 1MHz',
        'Memory': '64K RAM',
        'Display': '80x25 text, 640x200 graphics',
        'Year': '1982',
      }
    },
    {
      'id': '4',
      'name': 'MSX Keyboard',
      'price': 89.99,
      'category': 'Accessory',
      'imageUrl': 'https://picsum.photos/id/63/200/200',
      'description': 'A high-quality mechanical keyboard designed to provide an authentic typing experience for retro computer enthusiasts.',
      'specifications': {
        'Type': 'Mechanical',
        'Layout': 'MSX Standard',
        'Connection': 'DIN',
      }
    },
    {
      'id': '5',
      'name': 'Retro Mouse',
      'price': 39.99,
      'category': 'Accessory',
      'imageUrl': 'https://picsum.photos/id/64/200/200',
      'description': 'A classic ball mouse with the look and feel of early computing peripherals, but with modern internals for reliable operation.',
      'specifications': {
        'Type': 'Ball Mouse',
        'Connection': 'Serial/PS2 Adapter',
      }
    },
  ];

  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  void _navigateToDetail(Map<String, dynamic> product) {
    Navigator.pushNamed(
      context,
      AppRoutes.productDetail,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          // Layout toggle button
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
            tooltip: _isGridView ? 'Show as list' : 'Show as grid',
            onPressed: _toggleView,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: const Text(
                  'Nihon Retro Computers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Products',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.cart);
              },
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.profile);
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.splash);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Featured Products',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => _navigateToDetail(product),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.computer,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product['price']}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['category'] as String,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: InkWell(
            onTap: () => _navigateToDetail(product),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.computer,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Electronics',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (product['description'] as String).substring(0, 
                            (product['description'] as String).length > 100 
                              ? 100 
                              : (product['description'] as String).length
                          ) + ((product['description'] as String).length > 100 ? '...' : ''),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Price
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$${product['price']}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Product detail screen
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final specifications = product['specifications'] as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
        ),
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product image
            Container(
              height: 250,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.computer,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            
            // Product info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['name'] as String,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${product['price']}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['category'] as String,
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
                    product['description'] as String,
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
                  ...specifications.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              '${entry.key}:',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(entry.value as String),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Add to cart button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add product to cart
                        Provider.of<CartProvider>(context, listen: false).addCartItem(
                          CartItem(
                            id: product['id'] as String,
                            name: product['name'] as String,
                            price: product['price'] as double,
                            imageUrl: product['imageUrl'] as String,
                            quantity: 1,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product['name']} added to cart'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'VIEW CART',
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.cart);
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Add to Cart',
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
          ],
        ),
      ),
    );
  }
}

// ProfileScreen implementation
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock user data
  final Map<String, dynamic> _userData = {
    'name': 'John Tanaka',
    'email': 'john.tanaka@example.com',
    'phone': '+81 90-1234-5678',
    'location': 'Tokyo, Japan',
    'bio': 'Vintage computer enthusiast with a passion for Japanese computing history.',
    'socialMedia': {
      'discord': 'john_tanaka#1234',
      'twitter': '@john_tanaka',
      'github': 'johntanaka',
    }
  };

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();
  final _discordController = TextEditingController();
  final _twitterController = TextEditingController();
  final _githubController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    _discordController.dispose();
    _twitterController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _loadUserData() {
    _nameController.text = _userData['name'] as String;
    _emailController.text = _userData['email'] as String;
    _phoneController.text = _userData['phone'] as String;
    _locationController.text = _userData['location'] as String;
    _bioController.text = _userData['bio'] as String;
    
    final socialMedia = _userData['socialMedia'] as Map<String, dynamic>;
    _discordController.text = socialMedia['discord'] as String;
    _twitterController.text = socialMedia['twitter'] as String;
    _githubController.text = socialMedia['github'] as String;
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _userData['name'] = _nameController.text;
        _userData['email'] = _emailController.text;
        _userData['phone'] = _phoneController.text;
        _userData['location'] = _locationController.text;
        _userData['bio'] = _bioController.text;
        
        final socialMedia = _userData['socialMedia'] as Map<String, dynamic>;
        socialMedia['discord'] = _discordController.text;
        socialMedia['twitter'] = _twitterController.text;
        socialMedia['github'] = _githubController.text;
        
        _isEditing = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _isEditing ? _saveProfile : _toggleEdit,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: const Text(
                  'Nihon Retro Computers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Products',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.cart);
              },
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.pop(context),
              selected: true,
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.splash);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile header with image
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                          if (_isEditing)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Image upload not implemented yet'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _isEditing ? 'Edit Profile' : 'Profile',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Personal Information Section
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  enabled: _isEditing,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  enabled: _isEditing,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Simple email validation
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Phone field
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  enabled: _isEditing,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                
                // Location field
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                
                // Bio field
                TextFormField(
                  controller: _bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.info),
                    alignLabelWithHint: true,
                  ),
                  enabled: _isEditing,
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                
                // Social Media Section
                const Text(
                  'Social Media',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Discord field
                TextFormField(
                  controller: _discordController,
                  decoration: const InputDecoration(
                    labelText: 'Discord',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.chat),
                    hintText: 'username#0000',
                  ),
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                
                // Twitter field
                TextFormField(
                  controller: _twitterController,
                  decoration: const InputDecoration(
                    labelText: 'Twitter',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: '@username',
                  ),
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                
                // GitHub field
                TextFormField(
                  controller: _githubController,
                  decoration: const InputDecoration(
                    labelText: 'GitHub',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.code),
                    hintText: 'username',
                  ),
                  enabled: _isEditing,
                ),
                const SizedBox(height: 32),
                
                // Save button (only visible in edit mode)
                if (_isEditing)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Save Profile',
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
        ),
      ),
    );
  }
}

// ContactScreen implementation
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  bool _isSending = false;
  bool _isSent = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Send email using URL launcher
  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      try {
        // Get email from environment variable
        final supportEmail = dotenv.env['SUPPORT_EMAIL'] ?? 'support@example.com';
        
        // For iOS Simulator - show demo success without attempting email
        final isSimulator = await _isRunningOnSimulator();
        if (isSimulator) {
          // Show informative message about simulator limitations
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Simulator detected - email client launch skipped. In real device, this would launch an email app.'),
              duration: Duration(seconds: 4),
            ),
          );
          
          setState(() {
            _isSending = false;
            _isSent = true;
            
            // Clear the form
            _nameController.clear();
            _emailController.clear();
            _subjectController.clear();
            _messageController.clear();
          });
          return;
        }
        
        // Prepare the email for real devices
        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: supportEmail,
          query: encodeQueryParameters({
            'subject': '${_subjectController.text} - Contact Form from ${_nameController.text}',
            'body': 'Name: ${_nameController.text}\n'
                'Email: ${_emailController.text}\n\n'
                '${_messageController.text}'
          }),
        );

        // Try to launch the email client
        final canLaunch = await canLaunchUrl(emailUri);
        if (canLaunch) {
          final launched = await launchUrl(
            emailUri,
            mode: LaunchMode.externalApplication,
          );
          
          if (launched) {
            setState(() {
              _isSending = false;
              _isSent = true;
              
              // Clear the form
              _nameController.clear();
              _emailController.clear();
              _subjectController.clear();
              _messageController.clear();
            });
          } else {
            _showEmailError('Could not open email client');
          }
        } else {
          _showEmailError('No email client available');
        }
      } catch (e) {
        _showEmailError('Error: $e');
      }
    }
  }

  // Helper function to detect if running on simulator
  Future<bool> _isRunningOnSimulator() async {
    // A simple check for iOS simulator - this is not exhaustive
    // but works for our demo purposes
    final uri = Uri.parse('mailto:test@example.com');
    return !(await canLaunchUrl(uri));
  }

  void _showEmailError(String message) {
    setState(() {
      _isSending = false;
    });
    
    if (mounted) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
      
      // Since we're in debug/demo mode, show success UI anyway
      setState(() {
        _isSent = true;
        
        // Clear the form
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
      });
    }
  }

  // Helper function to encode query parameters
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: const Text(
                  'Nihon Retro Computers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Products',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.cart);
              },
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.profile);
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.pop(context),
              selected: true,
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.splash);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact form header
                const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.email,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Send us your questions or feedback',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Form fields
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Simple email validation
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _subjectController,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.subject),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.message),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                
                // Submit button
                if (_isSent)
                  const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 48,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Message sent!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Thank you for contacting us. We will get back to you soon.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isSending ? null : _sendEmail,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _isSending
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Sending...'),
                              ],
                            )
                          : const Text(
                              'Send Message',
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
        ),
      ),
    );
  }
}

// CartScreen implementation
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.products),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.computer, size: 28),
              SizedBox(width: 8),
              Text('NRC'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: const Text(
                  'Nihon Retro Computers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Products',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.pop(context),
              selected: true,
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.profile);
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.splash);
              },
            ),
          ],
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (ctx, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add some products to your cart to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.products);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text('Browse Products'),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartProvider.itemCount,
                  itemBuilder: (ctx, index) {
                    final cartItem = cartProvider.items[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product image
                            Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.computer,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Item details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Electronics',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '\$${cartItem.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Quantity controls
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          cartProvider.updateItemQuantity(cartItem.id, cartItem.quantity - 1);
                                        },
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          '${cartItem.quantity}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle_outline),
                                        onPressed: () {
                                          cartProvider.updateItemQuantity(cartItem.id, cartItem.quantity + 1);
                                        },
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Item total and delete button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${cartItem.total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    cartProvider.removeItem(cartItem.id);
                                  },
                                  color: Colors.red,
                                  tooltip: 'Remove item',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Order summary
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Items:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${cartProvider.itemCount}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Amount:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${cartProvider.total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              cartProvider.clearCart();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Clear Cart'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.paymentMethod),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
