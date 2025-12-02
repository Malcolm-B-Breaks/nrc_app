class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String products = '/products';
  static const String productDetail = '/product_detail';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String contact = '/contact';
  static const String orders = '/orders';
  static const String newsletter = '/newsletter';
  
  // Checkout flow routes
  static const String paymentMethod = '/checkout/payment-method';
  static const String cardPayment = '/checkout/payment-info/card';
  static const String paypalPayment = '/checkout/payment-info/paypal';
  static const String paymentConfirmation = '/checkout/payment-confirmation';
} 