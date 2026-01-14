// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Application NRC';

  @override
  String get appFullName => 'Ordinateurs Rétro de Nihon';

  @override
  String get appSlogan => 'Participez à la résurrection numérique';

  @override
  String get signIn => 'Se connecter';

  @override
  String get register => 'S\'inscrire';

  @override
  String get login => 'Connexion';

  @override
  String get logout => 'Déconnexion';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ?';

  @override
  String get skipLogin => 'Ignorer la connexion (pour les tests)';

  @override
  String get testProfilePage => 'Tester la page de profil';

  @override
  String get fullName => 'Nom complet';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get pleaseEnterName => 'Veuillez entrer votre nom';

  @override
  String get pleaseEnterEmail => 'Veuillez entrer votre e-mail';

  @override
  String get pleaseEnterValidEmail => 'Veuillez entrer un e-mail valide';

  @override
  String get pleaseEnterPassword => 'Veuillez entrer un mot de passe';

  @override
  String get passwordMinLength =>
      'Le mot de passe doit comporter au moins 6 caractères';

  @override
  String get pleaseConfirmPassword => 'Veuillez confirmer votre mot de passe';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get registrationSuccessful => 'Inscription réussie !';

  @override
  String get home => 'Accueil';

  @override
  String get products => 'Produits';

  @override
  String get featuredProducts => 'Produits en vedette';

  @override
  String get cart => 'Panier';

  @override
  String get profile => 'Profil';

  @override
  String get contact => 'Contact';

  @override
  String get orders => 'Commandes';

  @override
  String get description => 'Description';

  @override
  String get specifications => 'Spécifications';

  @override
  String get addToCart => 'Ajouter au panier';

  @override
  String addedToCart(Object product) {
    return '$product ajouté au panier';
  }

  @override
  String get viewCart => 'VOIR LE PANIER';

  @override
  String get yourCartIsEmpty => 'Votre panier est vide';

  @override
  String get addProductsToStart =>
      'Ajoutez des produits à votre panier pour commencer';

  @override
  String get browseProducts => 'Parcourir les produits';

  @override
  String get totalItems => 'Total des articles :';

  @override
  String get totalAmount => 'Montant total :';

  @override
  String get clearCart => 'Vider le panier';

  @override
  String get checkout => 'Commander';

  @override
  String get electronics => 'Électronique';

  @override
  String get personalInformation => 'Informations personnelles';

  @override
  String get name => 'Nom';

  @override
  String get phone => 'Téléphone';

  @override
  String get location => 'Emplacement';

  @override
  String get bio => 'Biographie';

  @override
  String get socialMedia => 'Réseaux sociaux';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get saveProfile => 'Enregistrer le profil';

  @override
  String get profileUpdatedSuccessfully => 'Profil mis à jour avec succès';

  @override
  String get imageUploadNotImplemented =>
      'Le téléchargement d\'images n\'est pas encore implémenté';

  @override
  String get contactUs => 'Contactez-nous';

  @override
  String get sendQuestionsOrFeedback =>
      'Envoyez-nous vos questions ou commentaires';

  @override
  String get subject => 'Sujet';

  @override
  String get message => 'Message';

  @override
  String get sendMessage => 'Envoyer le message';

  @override
  String get sending => 'Envoi en cours...';

  @override
  String get messageSent => 'Message envoyé !';

  @override
  String get thankYouForContacting =>
      'Merci de nous avoir contactés. Nous vous répondrons bientôt.';

  @override
  String errorEmail(Object error) {
    return 'Erreur : $error';
  }

  @override
  String get couldNotOpenEmailClient =>
      'Impossible d\'ouvrir le client de messagerie';

  @override
  String get noEmailClientAvailable => 'Aucun client de messagerie disponible';

  @override
  String get simulatorEmailMessage =>
      'Simulateur détecté - le lancement du client de messagerie a été ignoré. Sur un appareil réel, cela lancerait une application de messagerie.';

  @override
  String get selectPaymentMethod => 'Sélectionner un mode de paiement';

  @override
  String get choosePaymentMethod => 'Choisissez un mode de paiement';

  @override
  String get creditCard => 'Carte de crédit';

  @override
  String get payWithCard => 'Payer avec Visa, Mastercard, etc.';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => 'Payer avec votre compte PayPal';

  @override
  String get cardDetails => 'Détails de la carte';

  @override
  String get cardInformation => 'Informations de la carte';

  @override
  String get completeCardDetails => 'Please complete card details';

  @override
  String get cardNumber => 'Card number';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get nameOnCard => 'Nom sur la carte';

  @override
  String get enterNameOnCard => 'Please enter the name on your card';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Please enter a valid email';

  @override
  String get completeCardInformation => 'Please complete your card information';

  @override
  String get reviewPayment => 'Vérifier le paiement';

  @override
  String get paypalCheckout => 'Paiement PayPal';

  @override
  String get loginToPaypal => 'Log in to PayPal';

  @override
  String get emailOrMobile => 'E-mail ou numéro de mobile';

  @override
  String get orderSummary => 'Résumé de la commande';

  @override
  String get simulatedPaypal =>
      'Ceci est une page de connexion PayPal simulée à des fins de démonstration uniquement.';

  @override
  String get language => 'Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String languageChanged(Object language) {
    return 'Langue changée en $language';
  }

  @override
  String get english => 'Anglais';

  @override
  String get japanese => 'Japonais';

  @override
  String get spanish => 'Espagnol';

  @override
  String get mandarin => 'Chinois mandarin';

  @override
  String get cantonese => 'Cantonais';

  @override
  String get korean => 'Coréen';

  @override
  String get german => 'Allemand';

  @override
  String get french => 'Français';

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
