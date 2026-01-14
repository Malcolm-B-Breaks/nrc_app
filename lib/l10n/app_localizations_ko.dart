// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'NRC 앱';

  @override
  String get appFullName => 'Nihon Retro Computers';

  @override
  String get appSlogan => 'Be a Part of the Digital Resurrection';

  @override
  String get signIn => '로그인';

  @override
  String get register => '회원가입';

  @override
  String get login => 'Login';

  @override
  String get logout => '로그아웃';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get skipLogin => 'Skip login (for testing)';

  @override
  String get testProfilePage => 'Test Profile Page';

  @override
  String get fullName => '성명';

  @override
  String get email => '이메일';

  @override
  String get password => '비밀번호';

  @override
  String get confirmPassword => '비밀번호 확인';

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
  String get home => '홈';

  @override
  String get products => '제품';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get cart => '장바구니';

  @override
  String get profile => '프로필';

  @override
  String get contact => '문의하기';

  @override
  String get orders => 'Orders';

  @override
  String get description => '설명';

  @override
  String get specifications => '사양';

  @override
  String get addToCart => '장바구니에 추가';

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
  String get checkout => '결제하기';

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
  String get contactUs => '문의하기';

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
  String get selectPaymentMethod => '결제 방법을 선택하세요';

  @override
  String get choosePaymentMethod => 'Choose a payment method';

  @override
  String get creditCard => '신용카드';

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
  String get orderSummary => '주문 요약';

  @override
  String get simulatedPaypal =>
      'This is a simulated PayPal login page for demonstration purposes only.';

  @override
  String get language => '언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String languageChanged(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get english => '영어';

  @override
  String get japanese => '일본어';

  @override
  String get spanish => '스페인어';

  @override
  String get mandarin => 'Mandarin Chinese';

  @override
  String get cantonese => 'Cantonese';

  @override
  String get korean => '한국어';

  @override
  String get german => '독일어';

  @override
  String get french => '프랑스어';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get username => '사용자 이름';

  @override
  String get address => '주소';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get submit => '제출';

  @override
  String get search => '검색';

  @override
  String get filter => '필터';

  @override
  String get sortBy => '정렬 기준';

  @override
  String get price => '가격';

  @override
  String get quantity => '수량';

  @override
  String get total => '합계';

  @override
  String get continueShopping => '쇼핑 계속하기';

  @override
  String get orderTotal => '주문 합계';

  @override
  String get paymentMethod => '결제 방법';

  @override
  String get shippingAddress => '배송지 주소';

  @override
  String get billingAddress => '청구지 주소';

  @override
  String get sameAsShipping => '배송지와 동일';

  @override
  String get placeOrder => '주문하기';

  @override
  String get orderComplete => '주문 완료';

  @override
  String get thankYouForYourOrder => '주문해 주셔서 감사합니다';

  @override
  String get orderNumber => '주문 번호';

  @override
  String get trackOrder => '주문 추적';

  @override
  String get productDetails => '제품 상세정보';

  @override
  String get reviews => '리뷰';

  @override
  String get relatedProducts => '관련 제품';

  @override
  String get outOfStock => '품절';

  @override
  String get inStock => '재고 있음';

  @override
  String get onSale => '세일 중';

  @override
  String get newArrival => '신상품';

  @override
  String get bestSeller => '베스트셀러';

  @override
  String get congratulations => '축하합니다';

  @override
  String get errorOccurred => '오류가 발생했습니다';

  @override
  String get tryAgainLater => '나중에 다시 시도해 주세요';

  @override
  String get somethingWentWrong => '문제가 발생했습니다';

  @override
  String get pageNotFound => '페이지를 찾을 수 없습니다';

  @override
  String get goBackHome => '홈으로 돌아가기';

  @override
  String get required => '필수';

  @override
  String get invalidEmail => '유효하지 않은 이메일';

  @override
  String get passwordMismatch => '비밀번호가 일치하지 않습니다';

  @override
  String get passwordTooShort => '비밀번호가 너무 짧습니다';

  @override
  String get invalidPhoneNumber => '유효하지 않은 전화번호';

  @override
  String get fieldRequired => '이 필드는 필수입니다';

  @override
  String get removeFromCart => '장바구니에서 제거';

  @override
  String get emptyCart => '장바구니가 비어 있습니다';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get cashOnDelivery => '배송 시 현금 결제';

  @override
  String get bankTransfer => '계좌이체';

  @override
  String get creditCardNumber => '카드 번호';

  @override
  String get cardholderName => '카드 소유자 이름';

  @override
  String get expiryDate => '만료일';

  @override
  String get cvv => 'CVV';

  @override
  String get paymentSuccessful => '결제 성공';

  @override
  String get paymentFailed => '결제 실패';

  @override
  String get confirmOrder => '주문 확인';

  @override
  String get editOrder => '주문 수정';

  @override
  String get contactSupport => '고객 지원 문의';

  @override
  String get supportEmail => '지원 이메일';

  @override
  String get followUs => '팔로우하기';

  @override
  String get aboutUs => '회사 소개';

  @override
  String get termsAndConditions => '이용약관';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get faq => '자주 묻는 질문';

  @override
  String get help => '도움말';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get confirmDeleteAccount => '정말로 계정을 삭제하시겠습니까?';

  @override
  String get accountDeleted => '계정이 삭제되었습니다';

  @override
  String get darkMode => '다크 모드';

  @override
  String get lightMode => '라이트 모드';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get notifications => '알림';

  @override
  String get enableNotifications => '알림 활성화';

  @override
  String get disableNotifications => '알림 비활성화';

  @override
  String get update => '업데이트';

  @override
  String get version => '버전';

  @override
  String get newVersionAvailable => '새 버전이 사용 가능합니다';

  @override
  String get retry => '다시 시도';

  @override
  String get continueText => '계속';

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
  String get settings => '설정';

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
