import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/payment_service.dart';
import 'providers/cart_provider.dart';
import 'providers/language_provider.dart';
import 'models/cart_item.dart';
import 'screens/checkout/payment_method_screen.dart';
import 'screens/checkout/payment_info_screen.dart';
import 'screens/checkout/paypal_screen.dart';
import 'screens/checkout/payment_confirmation_screen.dart';
import 'screens/newsletter_screen.dart';
import 'utils/routes.dart';
import 'widgets/language_selector.dart';
import 'package:nrc_app/l10n/app_localizations.dart';
import 'widgets/app_header.dart';

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
  
  // Create and initialize providers
  final cartProvider = CartProvider();
  final languageProvider = LanguageProvider();
  
  // Initialize cart with a sample product for testing (before runApp so it's persisted)
  await cartProvider.addCartItem(
    CartItem(
      id: 'sample-1',
      name: 'Retro Computer Model X',
      price: 299.99,
      imageUrl: 'https://picsum.photos/id/60/200/200',
      quantity: 1,
    ),
  );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>.value(value: cartProvider),
        ChangeNotifierProvider<LanguageProvider>.value(value: languageProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current locale from the language provider
    final languageProvider = Provider.of<LanguageProvider>(context);
    
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
      // Localization configuration
      locale: languageProvider.locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        AppRoutes.splash: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.products: (context) => const ProductScreen(),
        AppRoutes.productDetail: (context) => const ProductDetailScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.contact: (context) => const ContactScreen(),
        AppRoutes.cart: (context) => const CartScreen(),
        AppRoutes.newsletter: (context) => const NewsletterScreen(),
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
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: 'NRC',
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
              appLocalizations.appTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
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
                  child: Text(appLocalizations.signIn),
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
                  child: Text(appLocalizations.register),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Test button for profile
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              child: Text(appLocalizations.profile),
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
      // Navigate to products page after successful login
      Navigator.pushReplacementNamed(context, AppRoutes.products);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.signIn,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: appLocalizations.email,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return appLocalizations.pleaseEnterEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: appLocalizations.password,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return appLocalizations.pleaseEnterPassword;
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
                child: Text(appLocalizations.login),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // For testing, navigate directly to products
                  Navigator.pushReplacementNamed(context, AppRoutes.products);
                },
                child: Text(appLocalizations.skipLogin),
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
        SnackBar(
          content: Text(AppLocalizations.of(context)!.registrationSuccessful),
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
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.register,
        showBackButton: true,
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
                  appLocalizations.createAccount,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                
                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: appLocalizations.fullName,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.pleaseEnterName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: appLocalizations.email,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.pleaseEnterEmail;
                    }
                    // Simple email validation
                    if (!value.contains('@') || !value.contains('.')) {
                      return appLocalizations.pleaseEnterValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Password field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: appLocalizations.password,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.pleaseEnterPassword;
                    }
                    if (value.length < 6) {
                      return appLocalizations.passwordMinLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Confirm password field
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: appLocalizations.confirmPassword,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.pleaseConfirmPassword;
                    }
                    if (value != _passwordController.text) {
                      return appLocalizations.passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                
                // Register button
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(appLocalizations.register),
                ),
                const SizedBox(height: 16),
                
                // Already have account link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appLocalizations.alreadyHaveAccount),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      },
                      child: Text(appLocalizations.signIn),
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
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.products,
        additionalActions: [
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
                child: Text(
                  appLocalizations.appTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                appLocalizations.products,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.cart,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.cart);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.profile,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.profile);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.contact,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.logout,
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
            child: Text(
              appLocalizations.featuredProducts,
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
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.productDetails,
        showBackButton: true,
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
                  Text(
                    appLocalizations.description,
                    style: const TextStyle(
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
                  Text(
                    appLocalizations.specifications,
                    style: const TextStyle(
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
                            content: Text(appLocalizations.addedToCart(product['name'] as String)),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: appLocalizations.viewCart,
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
                      child: Text(
                        appLocalizations.addToCart,
                        style: const TextStyle(
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

// Profile Screen implementation
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _editMode = false;
  bool _isLoading = false;
  
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Alex Tanaka');
  final _emailController = TextEditingController(text: 'alex.tanaka@example.com');
  final _phoneController = TextEditingController(text: '+81 90-1234-5678');
  final _locationController = TextEditingController(text: 'Tokyo, Japan');
  final _bioController = TextEditingController(
    text: 'Retro computing enthusiast with a particular interest in Japanese computers from the 80s and 90s.'
  );
  final _discordController = TextEditingController(text: 'alextanaka#1234');
  final _twitterController = TextEditingController(text: '@alextanaka');
  final _githubController = TextEditingController(text: 'alextanaka');

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

  void _toggleEditMode() {
    setState(() {
      _editMode = !_editMode;
    });
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() {
        _isLoading = false;
        _editMode = false;
      });
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.profileSaved),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.profile,
        showBackButton: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile header with avatar and edit button
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://picsum.photos/200'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              !_editMode
                                  ? Text(
                                      _nameController.text,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : TextFormField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        labelText: appLocalizations.fullName,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return appLocalizations.pleaseEnterName;
                                        }
                                        return null;
                                      },
                                    ),
                              const SizedBox(height: 4),
                              !_editMode
                                  ? Text(
                                      _emailController.text,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    )
                                  : TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        labelText: appLocalizations.email,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return appLocalizations.pleaseEnterEmail;
                                        }
                                        if (!value.contains('@')) {
                                          return appLocalizations.pleaseEnterValidEmail;
                                        }
                                        return null;
                                      },
                                    ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(_editMode ? Icons.cancel : Icons.edit),
                          onPressed: _toggleEditMode,
                          tooltip: _editMode ? appLocalizations.cancel : appLocalizations.edit,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Contact Information Section
                    Text(
                      appLocalizations.contactInformation,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Phone
                    !_editMode
                        ? ListTile(
                            leading: const Icon(Icons.phone),
                            title: Text(appLocalizations.phoneNumber),
                            subtitle: Text(_phoneController.text),
                            contentPadding: EdgeInsets.zero,
                          )
                        : TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: appLocalizations.phoneNumber,
                              prefixIcon: const Icon(Icons.phone),
                            ),
                          ),
                    
                    // Location
                    !_editMode
                        ? ListTile(
                            leading: const Icon(Icons.location_on),
                            title: Text(appLocalizations.location),
                            subtitle: Text(_locationController.text),
                            contentPadding: EdgeInsets.zero,
                          )
                        : TextFormField(
                            controller: _locationController,
                            decoration: InputDecoration(
                              labelText: appLocalizations.location,
                              prefixIcon: const Icon(Icons.location_on),
                            ),
                          ),
                    
                    const SizedBox(height: 24),
                    
                    // Bio Section
                    Text(
                      appLocalizations.about,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    !_editMode
                        ? Text(_bioController.text)
                        : TextFormField(
                            controller: _bioController,
                            decoration: InputDecoration(
                              labelText: appLocalizations.bio,
                              alignLabelWithHint: true,
                            ),
                            maxLines: 4,
                          ),
                    
                    const SizedBox(height: 24),
                    
                    // Social Media Section
                    Text(
                      appLocalizations.socialMedia,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Discord
                    !_editMode
                        ? ListTile(
                            leading: const Icon(CustomIcons.discord),
                            title: const Text('Discord'),
                            subtitle: Text(_discordController.text),
                            contentPadding: EdgeInsets.zero,
                          )
                        : TextFormField(
                            controller: _discordController,
                            decoration: const InputDecoration(
                              labelText: 'Discord',
                              prefixIcon: Icon(CustomIcons.discord),
                            ),
                          ),
                    
                    // Twitter
                    !_editMode
                        ? ListTile(
                            leading: const Icon(Icons.alternate_email),
                            title: const Text('Twitter'),
                            subtitle: Text(_twitterController.text),
                            contentPadding: EdgeInsets.zero,
                          )
                        : TextFormField(
                            controller: _twitterController,
                            decoration: const InputDecoration(
                              labelText: 'Twitter',
                              prefixIcon: Icon(Icons.alternate_email),
                            ),
                          ),
                    
                    // GitHub
                    !_editMode
                        ? ListTile(
                            leading: const Icon(Icons.code),
                            title: const Text('GitHub'),
                            subtitle: Text(_githubController.text),
                            contentPadding: EdgeInsets.zero,
                          )
                        : TextFormField(
                            controller: _githubController,
                            decoration: const InputDecoration(
                              labelText: 'GitHub',
                              prefixIcon: Icon(Icons.code),
                            ),
                          ),
                    
                    const SizedBox(height: 32),
                    
                    // Save button in edit mode
                    if (_editMode)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveProfile,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(appLocalizations.save),
                        ),
                      ),
                  ],
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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // In a real app, send the contact form data to a server
      setState(() {
        _isSubmitting = true;
      });
      
      // Simulate a network request
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSubmitting = false;
        });
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.messageSentSuccessfully),
            duration: const Duration(seconds: 3),
          ),
        );
        
        // Clear form fields
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final supportEmail = dotenv.env['SUPPORT_EMAIL'] ?? 'support@example.com';
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.contact,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.contactUs,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                appLocalizations.contactDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              
              // Contact Methods
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appLocalizations.contactMethods,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      
                      // Email
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: Text(appLocalizations.email),
                        subtitle: Text(supportEmail),
                        onTap: () {
                          launchUrl(Uri.parse('mailto:$supportEmail'));
                        },
                      ),
                      
                      // Phone
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text(appLocalizations.phone),
                        subtitle: const Text('+81 3-1234-5678'),
                        onTap: () {
                          launchUrl(Uri.parse('tel:+81312345678'));
                        },
                      ),
                      
                      // Social Media
                      ListTile(
                        leading: const Icon(CustomIcons.discord),
                        title: Text(appLocalizations.discordServer),
                        subtitle: const Text('NRC Community'),
                        onTap: () {
                          launchUrl(Uri.parse('https://discord.gg/nrc-community'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Contact Form
              Form(
                key: _formKey,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.sendMessage,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        
                        // Name Field
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: appLocalizations.fullName,
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return appLocalizations.pleaseEnterName;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: appLocalizations.email,
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return appLocalizations.pleaseEnterEmail;
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return appLocalizations.pleaseEnterValidEmail;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Message Field
                        TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            labelText: appLocalizations.message,
                            border: const OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return appLocalizations.pleaseEnterMessage;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isSubmitting ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: _isSubmitting
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(appLocalizations.sending),
                                    ],
                                  )
                                : Text(appLocalizations.send),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    final appLocalizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppHeader(
        title: appLocalizations.cart,
        showBackButton: true,
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
                child: Text(
                  appLocalizations.appFullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                appLocalizations.products,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.cart,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.pop(context),
              selected: true,
            ),
            ListTile(
              title: Text(
                appLocalizations.profile,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.profile);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.contact,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.contact);
              },
            ),
            ListTile(
              title: Text(
                appLocalizations.logout,
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
                  Text(
                    appLocalizations.yourCartIsEmpty,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    appLocalizations.addProductsToStart,
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
                    child: Text(appLocalizations.browseProducts),
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
                  itemCount: cartProvider.items.length,
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
                                    appLocalizations.electronics,
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
                                  tooltip: appLocalizations.removeFromCart,
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
                        Text(
                          appLocalizations.totalItems,
                          style: const TextStyle(fontSize: 16),
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
                        Text(
                          appLocalizations.totalAmount,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            child: Text(appLocalizations.clearCart),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.paymentMethod),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              appLocalizations.checkout,
                              style: const TextStyle(
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
