// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'NRC App';

  @override
  String get appFullName => 'Nihon Retro Computers';

  @override
  String get appSlogan => 'Be a Part of the Digital Resurrection';

  @override
  String get signIn => 'Sign In';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get skipLogin => 'Skip login (for testing)';

  @override
  String get testProfilePage => 'Test Profile Page';

  @override
  String get fullName => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterPassword => 'Please enter a password';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get registrationSuccessful => 'Registration successful!';

  @override
  String get home => 'Home';

  @override
  String get products => 'Products';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get cart => 'Cart';

  @override
  String get profile => 'Profile';

  @override
  String get contact => 'Contact';

  @override
  String get orders => 'Orders';

  @override
  String get description => 'Description';

  @override
  String get specifications => 'Specifications';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String addedToCart(Object product) {
    return '$product added to cart';
  }

  @override
  String get viewCart => 'VIEW CART';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get addProductsToStart =>
      'Add some products to your cart to get started';

  @override
  String get browseProducts => 'Browse Products';

  @override
  String get totalItems => 'Total Items:';

  @override
  String get totalAmount => 'Total Amount:';

  @override
  String get clearCart => 'Clear Cart';

  @override
  String get checkout => 'Checkout';

  @override
  String get electronics => 'Electronics';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone';

  @override
  String get location => 'Location';

  @override
  String get bio => 'Bio';

  @override
  String get socialMedia => 'Social Media';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get saveProfile => 'Save Profile';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get imageUploadNotImplemented => 'Image upload not implemented yet';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get sendQuestionsOrFeedback => 'Send us your questions or feedback';

  @override
  String get subject => 'Subject';

  @override
  String get message => 'Message';

  @override
  String get sendMessage => 'Send Message';

  @override
  String get sending => 'Sending...';

  @override
  String get messageSent => 'Message sent!';

  @override
  String get thankYouForContacting =>
      'Thank you for contacting us. We will get back to you soon.';

  @override
  String errorEmail(Object error) {
    return 'Error: $error';
  }

  @override
  String get couldNotOpenEmailClient => 'Could not open email client';

  @override
  String get noEmailClientAvailable => 'No email client available';

  @override
  String get simulatorEmailMessage =>
      'Simulator detected - email client launch skipped. In real device, this would launch an email app.';

  @override
  String get selectPaymentMethod => 'Select Payment Method';

  @override
  String get choosePaymentMethod => 'Choose a payment method';

  @override
  String get creditCard => 'Credit Card';

  @override
  String get payWithCard => 'Pay with Visa, Mastercard, etc.';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => 'Pay with your PayPal account';

  @override
  String get cardDetails => 'Card Details';

  @override
  String get cardInformation => 'Card Information';

  @override
  String get completeCardDetails => 'Please complete card details';

  @override
  String get cardNumber => 'Card number';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get nameOnCard => 'Name on Card';

  @override
  String get enterNameOnCard => 'Please enter the name on your card';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Please enter a valid email';

  @override
  String get completeCardInformation => 'Please complete your card information';

  @override
  String get reviewPayment => 'Review Payment';

  @override
  String get paypalCheckout => 'PayPal Checkout';

  @override
  String get loginToPaypal => 'Log in to PayPal';

  @override
  String get emailOrMobile => 'Email or mobile number';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get simulatedPaypal =>
      'This is a simulated PayPal login page for demonstration purposes only.';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String languageChanged(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get english => 'English';

  @override
  String get japanese => 'Japanese';

  @override
  String get spanish => 'Spanish';

  @override
  String get mandarin => 'Mandarin Chinese';

  @override
  String get cantonese => 'Cantonese';

  @override
  String get korean => 'Korean';

  @override
  String get german => 'German';

  @override
  String get french => 'French';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get username => 'Username';

  @override
  String get address => 'Address';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get submit => 'Submit';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get sortBy => 'Sort By';

  @override
  String get price => 'Price';

  @override
  String get quantity => 'Quantity';

  @override
  String get total => 'Total';

  @override
  String get continueShopping => 'Continue Shopping';

  @override
  String get orderTotal => 'Order Total';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get billingAddress => 'Billing Address';

  @override
  String get sameAsShipping => 'Same as Shipping';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get orderComplete => 'Order Complete';

  @override
  String get thankYouForYourOrder => 'Thank you for your order';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get productDetails => 'Product Details';

  @override
  String get reviews => 'Reviews';

  @override
  String get relatedProducts => 'Related Products';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get inStock => 'In Stock';

  @override
  String get onSale => 'On Sale';

  @override
  String get newArrival => 'New Arrival';

  @override
  String get bestSeller => 'Best Seller';

  @override
  String get congratulations => 'Congratulations';

  @override
  String get errorOccurred => 'Error Occurred';

  @override
  String get tryAgainLater => 'Please try again later';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get goBackHome => 'Go Back Home';

  @override
  String get required => 'Required';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get passwordTooShort => 'Password is too short';

  @override
  String get invalidPhoneNumber => 'Invalid Phone Number';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get removeFromCart => 'Remove from Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get bankTransfer => 'Bank Transfer';

  @override
  String get creditCardNumber => 'Credit Card Number';

  @override
  String get cardholderName => 'Cardholder Name';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get cvv => 'CVV';

  @override
  String get paymentSuccessful => 'Payment Successful';

  @override
  String get paymentFailed => 'Payment Failed';

  @override
  String get confirmOrder => 'Confirm Order';

  @override
  String get editOrder => 'Edit Order';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get supportEmail => 'Support Email';

  @override
  String get followUs => 'Follow Us';

  @override
  String get aboutUs => 'About Us';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get faq => 'FAQ';

  @override
  String get help => 'Help';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get confirmDeleteAccount =>
      'Are you sure you want to delete your account?';

  @override
  String get accountDeleted => 'Account Deleted';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get notifications => 'Notifications';

  @override
  String get enableNotifications => 'Enable Notifications';

  @override
  String get disableNotifications => 'Disable Notifications';

  @override
  String get update => 'Update';

  @override
  String get version => 'Version';

  @override
  String get newVersionAvailable => 'New Version Available';

  @override
  String get retry => 'Retry';

  @override
  String get continueText => 'Continue';

  @override
  String get contactDescription =>
      'We\'re here to help! Send us a message or contact us through one of the methods below.';

  @override
  String get contactMethods => 'Contact Methods';

  @override
  String get discordServer => 'Discord Server';

  @override
  String get pleaseEnterMessage => 'Please enter your message';

  @override
  String get messageSentSuccessfully => 'Message sent successfully!';

  @override
  String get send => 'Send';

  @override
  String get profileSaved => 'Profile saved successfully!';

  @override
  String get edit => 'Edit';

  @override
  String get about => 'About';

  @override
  String get payWithCreditCard => 'Pay with Visa, Mastercard, etc.';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tax => 'Tax';

  @override
  String get processingPayment => 'Processing payment...';

  @override
  String get endingIn => 'ending in';

  @override
  String get paypalAccount => 'PayPal Account';

  @override
  String get settings => 'Settings';

  @override
  String get newsletter => 'Newsletter';

  @override
  String get subscribeToNewsletter => 'Subscribe to our Newsletter';

  @override
  String get getLatestUpdates =>
      'Get the latest updates on retro computers and exclusive offers';

  @override
  String get enterEmailToSubscribe => 'Enter your email to subscribe';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get subscribing => 'Subscribing...';

  @override
  String get alreadySubscribed => 'You\'re already subscribed!';

  @override
  String get subscriptionSuccessful =>
      'Subscription successful! Check your email for confirmation.';

  @override
  String get subscriptionFailed => 'Subscription failed. Please try again.';

  @override
  String get emailAlreadySubscribed =>
      'This email is already subscribed to our newsletter';

  @override
  String get invalidEmailForNewsletter => 'Please enter a valid email address';
}
