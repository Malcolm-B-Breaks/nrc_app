// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'NRC App';

  @override
  String get appFullName => 'Nihon Retro Computer';

  @override
  String get appSlogan => 'Sei Teil der digitalen Wiederbelebung';

  @override
  String get signIn => 'Anmelden';

  @override
  String get register => 'Registrieren';

  @override
  String get login => 'Einloggen';

  @override
  String get logout => 'Ausloggen';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get alreadyHaveAccount => 'Haben Sie bereits ein Konto?';

  @override
  String get skipLogin => 'Login überspringen (zum Testen)';

  @override
  String get testProfilePage => 'Profilseite testen';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get email => 'E-Mail';

  @override
  String get password => 'Passwort';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get pleaseEnterName => 'Bitte geben Sie Ihren Namen ein';

  @override
  String get pleaseEnterEmail => 'Bitte geben Sie Ihre E-Mail-Adresse ein';

  @override
  String get pleaseEnterValidEmail =>
      'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get pleaseEnterPassword => 'Bitte geben Sie ein Passwort ein';

  @override
  String get passwordMinLength =>
      'Das Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get pleaseConfirmPassword => 'Bitte bestätigen Sie Ihr Passwort';

  @override
  String get passwordsDoNotMatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get registrationSuccessful => 'Registrierung erfolgreich!';

  @override
  String get home => 'Startseite';

  @override
  String get products => 'Produkte';

  @override
  String get featuredProducts => 'Ausgewählte Produkte';

  @override
  String get cart => 'Warenkorb';

  @override
  String get profile => 'Profil';

  @override
  String get contact => 'Kontakt';

  @override
  String get orders => 'Bestellungen';

  @override
  String get description => 'Beschreibung';

  @override
  String get specifications => 'Spezifikationen';

  @override
  String get addToCart => 'In den Warenkorb';

  @override
  String addedToCart(Object product) {
    return '$product zum Warenkorb hinzugefügt';
  }

  @override
  String get viewCart => 'WARENKORB ANZEIGEN';

  @override
  String get yourCartIsEmpty => 'Ihr Warenkorb ist leer';

  @override
  String get addProductsToStart =>
      'Fügen Sie Produkte zu Ihrem Warenkorb hinzu, um zu beginnen';

  @override
  String get browseProducts => 'Produkte durchsuchen';

  @override
  String get totalItems => 'Gesamtanzahl:';

  @override
  String get totalAmount => 'Gesamtbetrag:';

  @override
  String get clearCart => 'Warenkorb leeren';

  @override
  String get checkout => 'Zur Kasse';

  @override
  String get electronics => 'Elektronik';

  @override
  String get personalInformation => 'Persönliche Informationen';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Telefon';

  @override
  String get location => 'Ort';

  @override
  String get bio => 'Biografie';

  @override
  String get socialMedia => 'Soziale Medien';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get saveProfile => 'Profil speichern';

  @override
  String get profileUpdatedSuccessfully => 'Profil erfolgreich aktualisiert';

  @override
  String get imageUploadNotImplemented =>
      'Bildupload ist noch nicht implementiert';

  @override
  String get contactUs => 'Kontaktieren Sie uns';

  @override
  String get sendQuestionsOrFeedback =>
      'Senden Sie uns Ihre Fragen oder Feedback';

  @override
  String get subject => 'Betreff';

  @override
  String get message => 'Nachricht';

  @override
  String get sendMessage => 'Nachricht senden';

  @override
  String get sending => 'Wird gesendet...';

  @override
  String get messageSent => 'Nachricht gesendet!';

  @override
  String get thankYouForContacting =>
      'Vielen Dank für Ihre Kontaktaufnahme. Wir werden uns in Kürze bei Ihnen melden.';

  @override
  String errorEmail(Object error) {
    return 'Fehler: $error';
  }

  @override
  String get couldNotOpenEmailClient =>
      'E-Mail-Client konnte nicht geöffnet werden';

  @override
  String get noEmailClientAvailable => 'Kein E-Mail-Client verfügbar';

  @override
  String get simulatorEmailMessage =>
      'Simulator erkannt - E-Mail-Client-Start übersprungen. Auf einem echten Gerät würde eine E-Mail-App gestartet werden.';

  @override
  String get selectPaymentMethod => 'Zahlungsmethode auswählen';

  @override
  String get choosePaymentMethod => 'Wählen Sie eine Zahlungsmethode';

  @override
  String get creditCard => 'Kreditkarte';

  @override
  String get payWithCard => 'Mit Visa, Mastercard usw. bezahlen';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => 'Mit Ihrem PayPal-Konto bezahlen';

  @override
  String get cardDetails => 'Kartendetails';

  @override
  String get cardInformation => 'Karteninformationen';

  @override
  String get completeCardDetails => 'Please complete card details';

  @override
  String get cardNumber => 'Card number';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get nameOnCard => 'Name auf der Karte';

  @override
  String get enterNameOnCard => 'Please enter the name on your card';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Please enter a valid email';

  @override
  String get completeCardInformation => 'Please complete your card information';

  @override
  String get reviewPayment => 'Zahlung überprüfen';

  @override
  String get paypalCheckout => 'PayPal-Zahlung';

  @override
  String get loginToPaypal => 'Log in to PayPal';

  @override
  String get emailOrMobile => 'E-Mail oder Mobilnummer';

  @override
  String get orderSummary => 'Bestellübersicht';

  @override
  String get simulatedPaypal =>
      'Dies ist eine simulierte PayPal-Anmeldeseite nur zu Demonstrationszwecken.';

  @override
  String get language => 'Sprache';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String languageChanged(Object language) {
    return 'Sprache wurde zu $language geändert';
  }

  @override
  String get english => 'Englisch';

  @override
  String get japanese => 'Japanisch';

  @override
  String get spanish => 'Spanisch';

  @override
  String get mandarin => 'Chinesisch (Mandarin)';

  @override
  String get cantonese => 'Kantonesisch';

  @override
  String get korean => 'Koreanisch';

  @override
  String get german => 'Deutsch';

  @override
  String get french => 'Französisch';

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
