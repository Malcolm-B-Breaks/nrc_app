// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Aplicación NRC';

  @override
  String get appFullName => 'Computadoras Retro de Nihon';

  @override
  String get appSlogan => 'Sé parte de la resurrección digital';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get register => 'Registrarse';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get skipLogin => 'Omitir inicio de sesión (para pruebas)';

  @override
  String get testProfilePage => 'Probar página de perfil';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get pleaseEnterName => 'Por favor, introduce tu nombre';

  @override
  String get pleaseEnterEmail => 'Por favor, introduce tu correo electrónico';

  @override
  String get pleaseEnterValidEmail =>
      'Por favor, introduce un correo electrónico válido';

  @override
  String get pleaseEnterPassword => 'Por favor, introduce una contraseña';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get pleaseConfirmPassword => 'Por favor, confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get registrationSuccessful => '¡Registro exitoso!';

  @override
  String get home => 'Inicio';

  @override
  String get products => 'Productos';

  @override
  String get featuredProducts => 'Productos destacados';

  @override
  String get cart => 'Carrito';

  @override
  String get profile => 'Perfil';

  @override
  String get contact => 'Contacto';

  @override
  String get orders => 'Pedidos';

  @override
  String get description => 'Descripción';

  @override
  String get specifications => 'Especificaciones';

  @override
  String get addToCart => 'Añadir al carrito';

  @override
  String addedToCart(Object product) {
    return '$product añadido al carrito';
  }

  @override
  String get viewCart => 'VER CARRITO';

  @override
  String get yourCartIsEmpty => 'Tu carrito está vacío';

  @override
  String get addProductsToStart =>
      'Añade algunos productos a tu carrito para comenzar';

  @override
  String get browseProducts => 'Explorar productos';

  @override
  String get totalItems => 'Total de artículos:';

  @override
  String get totalAmount => 'Importe total:';

  @override
  String get clearCart => 'Vaciar carrito';

  @override
  String get checkout => 'Realizar pedido';

  @override
  String get electronics => 'Electrónica';

  @override
  String get personalInformation => 'Información personal';

  @override
  String get name => 'Nombre';

  @override
  String get phone => 'Teléfono';

  @override
  String get location => 'Ubicación';

  @override
  String get bio => 'Biografía';

  @override
  String get socialMedia => 'Redes sociales';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get saveProfile => 'Guardar perfil';

  @override
  String get profileUpdatedSuccessfully => 'Perfil actualizado correctamente';

  @override
  String get imageUploadNotImplemented =>
      'La carga de imágenes aún no está implementada';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get sendQuestionsOrFeedback => 'Envíanos tus preguntas o comentarios';

  @override
  String get subject => 'Asunto';

  @override
  String get message => 'Mensaje';

  @override
  String get sendMessage => 'Enviar mensaje';

  @override
  String get sending => 'Enviando...';

  @override
  String get messageSent => '¡Mensaje enviado!';

  @override
  String get thankYouForContacting =>
      'Gracias por contactarnos. Te responderemos pronto.';

  @override
  String errorEmail(Object error) {
    return 'Error: $error';
  }

  @override
  String get couldNotOpenEmailClient => 'No se pudo abrir el cliente de correo';

  @override
  String get noEmailClientAvailable => 'No hay cliente de correo disponible';

  @override
  String get simulatorEmailMessage =>
      'Simulador detectado - se omitió el lanzamiento del cliente de correo. En un dispositivo real, esto lanzaría una aplicación de correo.';

  @override
  String get selectPaymentMethod => 'Seleccionar método de pago';

  @override
  String get choosePaymentMethod => 'Elige un método de pago';

  @override
  String get creditCard => 'Tarjeta de crédito';

  @override
  String get payWithCard => 'Pagar con Visa, Mastercard, etc.';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => 'Pagar con tu cuenta de PayPal';

  @override
  String get cardDetails => 'Detalles de la tarjeta';

  @override
  String get cardInformation => 'Información de la tarjeta';

  @override
  String get completeCardDetails => 'Please complete card details';

  @override
  String get cardNumber => 'Card number';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get nameOnCard => 'Nombre en la tarjeta';

  @override
  String get enterNameOnCard => 'Please enter the name on your card';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Please enter a valid email';

  @override
  String get completeCardInformation => 'Please complete your card information';

  @override
  String get reviewPayment => 'Revisar pago';

  @override
  String get paypalCheckout => 'Pago con PayPal';

  @override
  String get loginToPaypal => 'Log in to PayPal';

  @override
  String get emailOrMobile => 'Correo electrónico o número móvil';

  @override
  String get orderSummary => 'Resumen del pedido';

  @override
  String get simulatedPaypal =>
      'Esta es una página de inicio de sesión de PayPal simulada solo con fines de demostración.';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String languageChanged(Object language) {
    return 'Idioma cambiado a $language';
  }

  @override
  String get english => 'Inglés';

  @override
  String get japanese => 'Japonés';

  @override
  String get spanish => 'Español';

  @override
  String get mandarin => 'Chino mandarín';

  @override
  String get cantonese => 'Cantonés';

  @override
  String get korean => 'Coreano';

  @override
  String get german => 'Alemán';

  @override
  String get french => 'Francés';

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
