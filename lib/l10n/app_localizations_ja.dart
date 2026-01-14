// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'NRCアプリ';

  @override
  String get appFullName => '日本レトロコンピューター';

  @override
  String get appSlogan => 'デジタルの復活に参加しよう';

  @override
  String get signIn => 'サインイン';

  @override
  String get register => '登録';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get createAccount => 'アカウント作成';

  @override
  String get alreadyHaveAccount => 'すでにアカウントをお持ちですか？';

  @override
  String get skipLogin => 'ログインをスキップ（テスト用）';

  @override
  String get testProfilePage => 'プロフィールページをテスト';

  @override
  String get fullName => '氏名';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get confirmPassword => 'パスワード確認';

  @override
  String get pleaseEnterName => 'お名前を入力してください';

  @override
  String get pleaseEnterEmail => 'メールアドレスを入力してください';

  @override
  String get pleaseEnterValidEmail => '有効なメールアドレスを入力してください';

  @override
  String get pleaseEnterPassword => 'パスワードを入力してください';

  @override
  String get passwordMinLength => 'パスワードは6文字以上である必要があります';

  @override
  String get pleaseConfirmPassword => 'パスワードを確認してください';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get registrationSuccessful => '登録が完了しました！';

  @override
  String get home => 'ホーム';

  @override
  String get products => '製品';

  @override
  String get featuredProducts => 'おすすめ製品';

  @override
  String get cart => 'カート';

  @override
  String get profile => 'プロフィール';

  @override
  String get contact => 'お問い合わせ';

  @override
  String get orders => '注文履歴';

  @override
  String get description => '説明';

  @override
  String get specifications => '仕様';

  @override
  String get addToCart => 'カートに追加';

  @override
  String addedToCart(Object product) {
    return '$productがカートに追加されました';
  }

  @override
  String get viewCart => 'カートを見る';

  @override
  String get yourCartIsEmpty => 'カートは空です';

  @override
  String get addProductsToStart => '製品をカートに追加してください';

  @override
  String get browseProducts => '製品を閲覧する';

  @override
  String get totalItems => '合計アイテム数：';

  @override
  String get totalAmount => '合計金額：';

  @override
  String get clearCart => 'カートを空にする';

  @override
  String get checkout => 'チェックアウト';

  @override
  String get electronics => '電子機器';

  @override
  String get personalInformation => '個人情報';

  @override
  String get name => '名前';

  @override
  String get phone => '電話番号';

  @override
  String get location => '場所';

  @override
  String get bio => '自己紹介';

  @override
  String get socialMedia => 'ソーシャルメディア';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => 'プロフィール編集';

  @override
  String get saveProfile => 'プロフィールを保存';

  @override
  String get profileUpdatedSuccessfully => 'プロフィールが更新されました';

  @override
  String get imageUploadNotImplemented => '画像アップロードはまだ実装されていません';

  @override
  String get contactUs => 'お問い合わせ';

  @override
  String get sendQuestionsOrFeedback => '質問やフィードバックをお送りください';

  @override
  String get subject => '件名';

  @override
  String get message => 'メッセージ';

  @override
  String get sendMessage => 'メッセージを送信';

  @override
  String get sending => '送信中...';

  @override
  String get messageSent => 'メッセージが送信されました！';

  @override
  String get thankYouForContacting => 'お問い合わせありがとうございます。すぐにご連絡いたします。';

  @override
  String errorEmail(Object error) {
    return 'エラー: $error';
  }

  @override
  String get couldNotOpenEmailClient => 'メールクライアントを開けませんでした';

  @override
  String get noEmailClientAvailable => '利用可能なメールクライアントがありません';

  @override
  String get simulatorEmailMessage =>
      'シミュレータが検出されました - メールクライアントの起動をスキップしました。実際のデバイスでは、メールアプリが起動します。';

  @override
  String get selectPaymentMethod => '支払い方法を選択';

  @override
  String get choosePaymentMethod => '支払い方法を選択してください';

  @override
  String get creditCard => 'クレジットカード';

  @override
  String get payWithCard => 'Visa、Mastercardなどで支払う';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => 'PayPalアカウントで支払う';

  @override
  String get cardDetails => 'カード詳細';

  @override
  String get cardInformation => 'カード情報';

  @override
  String get completeCardDetails => 'Please complete card details';

  @override
  String get cardNumber => 'Card number';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get nameOnCard => 'カード名義';

  @override
  String get enterNameOnCard => 'Please enter the name on your card';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Please enter a valid email';

  @override
  String get completeCardInformation => 'Please complete your card information';

  @override
  String get reviewPayment => '支払いを確認';

  @override
  String get paypalCheckout => 'PayPalチェックアウト';

  @override
  String get loginToPaypal => 'Log in to PayPal';

  @override
  String get emailOrMobile => 'メールアドレスまたは携帯電話番号';

  @override
  String get orderSummary => '注文の概要';

  @override
  String get simulatedPaypal => 'これはデモンストレーション目的のためのシミュレートされたPayPalログインページです。';

  @override
  String get language => '言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String languageChanged(Object language) {
    return '言語が$languageに変更されました';
  }

  @override
  String get english => '英語';

  @override
  String get japanese => '日本語';

  @override
  String get spanish => 'スペイン語';

  @override
  String get mandarin => '中国語（標準）';

  @override
  String get cantonese => '広東語';

  @override
  String get korean => '韓国語';

  @override
  String get german => 'ドイツ語';

  @override
  String get french => 'フランス語';

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
