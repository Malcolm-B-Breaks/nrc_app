// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'NRC 应用';

  @override
  String get appFullName => 'Nihon Retro Computers';

  @override
  String get appSlogan => 'Be a Part of the Digital Resurrection';

  @override
  String get signIn => '登录';

  @override
  String get register => '注册';

  @override
  String get login => 'Login';

  @override
  String get logout => '退出登录';

  @override
  String get createAccount => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get skipLogin => 'Skip login (for testing)';

  @override
  String get testProfilePage => 'Test Profile Page';

  @override
  String get fullName => '全名';

  @override
  String get email => '电子邮件';

  @override
  String get password => '密码';

  @override
  String get confirmPassword => '确认密码';

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
  String get home => '首页';

  @override
  String get products => '产品';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get cart => '购物车';

  @override
  String get profile => '个人资料';

  @override
  String get contact => '联系我们';

  @override
  String get orders => 'Orders';

  @override
  String get description => '描述';

  @override
  String get specifications => '规格';

  @override
  String get addToCart => '加入购物车';

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
  String get checkout => '结账';

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
  String get contactUs => '联系我们';

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
  String get selectPaymentMethod => '选择支付方式';

  @override
  String get choosePaymentMethod => 'Choose a payment method';

  @override
  String get creditCard => '信用卡';

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
  String get orderSummary => '订单摘要';

  @override
  String get simulatedPaypal =>
      'This is a simulated PayPal login page for demonstration purposes only.';

  @override
  String get language => '语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String languageChanged(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get english => '英语';

  @override
  String get japanese => '日语';

  @override
  String get spanish => '西班牙语';

  @override
  String get mandarin => 'Mandarin Chinese';

  @override
  String get cantonese => 'Cantonese';

  @override
  String get korean => '韩语';

  @override
  String get german => '德语';

  @override
  String get french => '法语';

  @override
  String get forgotPassword => '忘记密码?';

  @override
  String get username => '用户名';

  @override
  String get address => '地址';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get submit => '提交';

  @override
  String get search => '搜索';

  @override
  String get filter => '筛选';

  @override
  String get sortBy => '排序方式';

  @override
  String get price => '价格';

  @override
  String get quantity => '数量';

  @override
  String get total => '总计';

  @override
  String get continueShopping => '继续购物';

  @override
  String get orderTotal => '订单总额';

  @override
  String get paymentMethod => '支付方式';

  @override
  String get shippingAddress => '配送地址';

  @override
  String get billingAddress => '账单地址';

  @override
  String get sameAsShipping => '与配送地址相同';

  @override
  String get placeOrder => '下单';

  @override
  String get orderComplete => '订单完成';

  @override
  String get thankYouForYourOrder => '感谢您的订购';

  @override
  String get orderNumber => '订单号';

  @override
  String get trackOrder => '追踪订单';

  @override
  String get productDetails => '产品详情';

  @override
  String get reviews => '评论';

  @override
  String get relatedProducts => '相关产品';

  @override
  String get outOfStock => '缺货';

  @override
  String get inStock => '有现货';

  @override
  String get onSale => '特价';

  @override
  String get newArrival => '新品';

  @override
  String get bestSeller => '畅销产品';

  @override
  String get congratulations => '恭喜';

  @override
  String get errorOccurred => '发生错误';

  @override
  String get tryAgainLater => '请稍后再试';

  @override
  String get somethingWentWrong => '出现问题';

  @override
  String get pageNotFound => '找不到页面';

  @override
  String get goBackHome => '返回首页';

  @override
  String get required => '必填';

  @override
  String get invalidEmail => '无效邮箱';

  @override
  String get passwordMismatch => '密码不匹配';

  @override
  String get passwordTooShort => '密码太短';

  @override
  String get invalidPhoneNumber => '无效电话号码';

  @override
  String get fieldRequired => '此字段为必填项';

  @override
  String get removeFromCart => '从购物车移除';

  @override
  String get emptyCart => '购物车是空的';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get cashOnDelivery => '货到付款';

  @override
  String get bankTransfer => '银行转账';

  @override
  String get creditCardNumber => '信用卡号';

  @override
  String get cardholderName => '持卡人姓名';

  @override
  String get expiryDate => '到期日';

  @override
  String get cvv => 'CVV';

  @override
  String get paymentSuccessful => '支付成功';

  @override
  String get paymentFailed => '支付失败';

  @override
  String get confirmOrder => '确认订单';

  @override
  String get editOrder => '编辑订单';

  @override
  String get contactSupport => '联系客服';

  @override
  String get supportEmail => '客服邮箱';

  @override
  String get followUs => '关注我们';

  @override
  String get aboutUs => '关于我们';

  @override
  String get termsAndConditions => '条款与条件';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get faq => '常见问题';

  @override
  String get help => '帮助';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get confirmDeleteAccount => '确定要删除您的账户吗？';

  @override
  String get accountDeleted => '账户已删除';

  @override
  String get darkMode => '深色模式';

  @override
  String get lightMode => '浅色模式';

  @override
  String get systemDefault => '系统默认';

  @override
  String get notifications => '通知';

  @override
  String get enableNotifications => '启用通知';

  @override
  String get disableNotifications => '禁用通知';

  @override
  String get update => '更新';

  @override
  String get version => '版本';

  @override
  String get newVersionAvailable => '有新版本可用';

  @override
  String get retry => '重试';

  @override
  String get continueText => '继续';

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
  String get settings => '设置';

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

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get appTitle => 'NRC应用';

  @override
  String get appFullName => '日本复古电脑';

  @override
  String get appSlogan => '参与数字复兴';

  @override
  String get signIn => '登录';

  @override
  String get register => '注册';

  @override
  String get login => '登录';

  @override
  String get logout => '退出登录';

  @override
  String get createAccount => '创建账户';

  @override
  String get alreadyHaveAccount => '已有账户？';

  @override
  String get skipLogin => '跳过登录（测试用）';

  @override
  String get testProfilePage => '测试个人资料页面';

  @override
  String get fullName => '全名';

  @override
  String get email => '电子邮件';

  @override
  String get password => '密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get pleaseEnterName => '请输入您的姓名';

  @override
  String get pleaseEnterEmail => '请输入您的电子邮件';

  @override
  String get pleaseEnterValidEmail => '请输入有效的电子邮件';

  @override
  String get pleaseEnterPassword => '请输入密码';

  @override
  String get passwordMinLength => '密码必须至少包含6个字符';

  @override
  String get pleaseConfirmPassword => '请确认您的密码';

  @override
  String get passwordsDoNotMatch => '密码不匹配';

  @override
  String get registrationSuccessful => '注册成功！';

  @override
  String get home => '首页';

  @override
  String get products => '产品';

  @override
  String get featuredProducts => '精选产品';

  @override
  String get cart => '购物车';

  @override
  String get profile => '个人资料';

  @override
  String get contact => '联系我们';

  @override
  String get orders => '订单';

  @override
  String get description => '描述';

  @override
  String get specifications => '规格';

  @override
  String get addToCart => '加入购物车';

  @override
  String addedToCart(Object product) {
    return '$product已加入购物车';
  }

  @override
  String get viewCart => '查看购物车';

  @override
  String get yourCartIsEmpty => '您的购物车是空的';

  @override
  String get addProductsToStart => '添加一些产品到您的购物车以开始';

  @override
  String get browseProducts => '浏览产品';

  @override
  String get totalItems => '总项目：';

  @override
  String get totalAmount => '总金额：';

  @override
  String get clearCart => '清空购物车';

  @override
  String get checkout => '结账';

  @override
  String get electronics => '电子产品';

  @override
  String get personalInformation => '个人信息';

  @override
  String get name => '姓名';

  @override
  String get phone => '电话';

  @override
  String get location => '位置';

  @override
  String get bio => '个人简介';

  @override
  String get socialMedia => '社交媒体';

  @override
  String get discord => 'Discord';

  @override
  String get twitter => 'Twitter';

  @override
  String get github => 'GitHub';

  @override
  String get editProfile => '编辑资料';

  @override
  String get saveProfile => '保存资料';

  @override
  String get profileUpdatedSuccessfully => '个人资料更新成功';

  @override
  String get imageUploadNotImplemented => '图片上传功能尚未实现';

  @override
  String get contactUs => '联系我们';

  @override
  String get sendQuestionsOrFeedback => '发送您的问题或反馈';

  @override
  String get subject => '主题';

  @override
  String get message => '信息';

  @override
  String get sendMessage => '发送信息';

  @override
  String get sending => '发送中...';

  @override
  String get messageSent => '信息已发送！';

  @override
  String get thankYouForContacting => '感谢您联系我们，我们会尽快回复您。';

  @override
  String errorEmail(Object error) {
    return '错误：$error';
  }

  @override
  String get couldNotOpenEmailClient => '无法打开邮件客户端';

  @override
  String get noEmailClientAvailable => '没有可用的邮件客户端';

  @override
  String get simulatorEmailMessage => '检测到模拟器 - 跳过启动邮件客户端。在真实设备上，这将启动邮件应用程序。';

  @override
  String get selectPaymentMethod => '选择支付方式';

  @override
  String get choosePaymentMethod => '选择一种支付方式';

  @override
  String get creditCard => '信用卡';

  @override
  String get payWithCard => '使用Visa、Mastercard等付款';

  @override
  String get paypal => 'PayPal';

  @override
  String get payWithPaypal => '使用您的PayPal账户付款';

  @override
  String get cardDetails => '卡片详情';

  @override
  String get cardInformation => '卡片信息';

  @override
  String get nameOnCard => '卡片上的姓名';

  @override
  String get reviewPayment => '确认支付';

  @override
  String get paypalCheckout => 'PayPal结账';

  @override
  String get emailOrMobile => '电子邮件或手机号码';

  @override
  String get orderSummary => '订单摘要';

  @override
  String get simulatedPaypal => '这是仅用于演示目的的模拟PayPal登录页面。';

  @override
  String get language => '语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String languageChanged(Object language) {
    return '语言已更改为$language';
  }

  @override
  String get english => '英语';

  @override
  String get japanese => '日语';

  @override
  String get spanish => '西班牙语';

  @override
  String get mandarin => '普通话';

  @override
  String get cantonese => '粤语';

  @override
  String get korean => '韩语';

  @override
  String get german => '德语';

  @override
  String get french => '法语';
}

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class AppLocalizationsZhHk extends AppLocalizationsZh {
  AppLocalizationsZhHk() : super('zh_HK');

  @override
  String get appTitle => 'NRC 應用程式';

  @override
  String get signIn => '登入';

  @override
  String get register => '註冊';

  @override
  String get logout => '登出';

  @override
  String get fullName => '全名';

  @override
  String get email => '電郵';

  @override
  String get password => '密碼';

  @override
  String get confirmPassword => '確認密碼';

  @override
  String get home => '主頁';

  @override
  String get products => '產品';

  @override
  String get cart => '購物車';

  @override
  String get profile => '個人資料';

  @override
  String get contact => '聯絡我們';

  @override
  String get description => '描述';

  @override
  String get specifications => '規格';

  @override
  String get addToCart => '加入購物車';

  @override
  String get checkout => '結帳';

  @override
  String get contactUs => '聯絡我們';

  @override
  String get selectPaymentMethod => '選擇付款方式';

  @override
  String get creditCard => '信用卡';

  @override
  String get paypal => 'PayPal';

  @override
  String get orderSummary => '訂單摘要';

  @override
  String get language => '語言';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get english => '英文';

  @override
  String get japanese => '日文';

  @override
  String get spanish => '西班牙文';

  @override
  String get korean => '韓文';

  @override
  String get german => '德文';

  @override
  String get french => '法文';

  @override
  String get forgotPassword => '忘記密碼?';

  @override
  String get username => '用戶名';

  @override
  String get address => '地址';

  @override
  String get phoneNumber => '電話號碼';

  @override
  String get save => '儲存';

  @override
  String get cancel => '取消';

  @override
  String get submit => '提交';

  @override
  String get search => '搜尋';

  @override
  String get filter => '篩選';

  @override
  String get sortBy => '排序方式';

  @override
  String get price => '價格';

  @override
  String get quantity => '數量';

  @override
  String get total => '總計';

  @override
  String get continueShopping => '繼續購物';

  @override
  String get orderTotal => '訂單總額';

  @override
  String get paymentMethod => '付款方式';

  @override
  String get shippingAddress => '送貨地址';

  @override
  String get billingAddress => '賬單地址';

  @override
  String get sameAsShipping => '與送貨地址相同';

  @override
  String get placeOrder => '下單';

  @override
  String get orderComplete => '訂單完成';

  @override
  String get thankYouForYourOrder => '感謝您的訂購';

  @override
  String get orderNumber => '訂單號碼';

  @override
  String get trackOrder => '追蹤訂單';

  @override
  String get productDetails => '產品詳情';

  @override
  String get reviews => '評論';

  @override
  String get relatedProducts => '相關產品';

  @override
  String get outOfStock => '缺貨';

  @override
  String get inStock => '有現貨';

  @override
  String get onSale => '特價';

  @override
  String get newArrival => '新品';

  @override
  String get bestSeller => '暢銷產品';

  @override
  String get congratulations => '恭喜';

  @override
  String get errorOccurred => '發生錯誤';

  @override
  String get tryAgainLater => '請稍後再試';

  @override
  String get somethingWentWrong => '出現問題';

  @override
  String get pageNotFound => '找不到頁面';

  @override
  String get goBackHome => '返回主頁';

  @override
  String get required => '必填';

  @override
  String get invalidEmail => '無效電郵';

  @override
  String get passwordMismatch => '密碼不匹配';

  @override
  String get passwordTooShort => '密碼太短';

  @override
  String get invalidPhoneNumber => '無效電話號碼';

  @override
  String get fieldRequired => '此欄必填';

  @override
  String get removeFromCart => '從購物車移除';

  @override
  String get emptyCart => '購物車是空的';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get cashOnDelivery => '貨到付款';

  @override
  String get bankTransfer => '銀行轉賬';

  @override
  String get creditCardNumber => '信用卡號碼';

  @override
  String get cardholderName => '持卡人姓名';

  @override
  String get expiryDate => '到期日';

  @override
  String get cvv => 'CVV';

  @override
  String get paymentSuccessful => '付款成功';

  @override
  String get paymentFailed => '付款失敗';

  @override
  String get confirmOrder => '確認訂單';

  @override
  String get editOrder => '編輯訂單';

  @override
  String get contactSupport => '聯絡客服';

  @override
  String get supportEmail => '客服電郵';

  @override
  String get followUs => '關注我們';

  @override
  String get aboutUs => '關於我們';

  @override
  String get termsAndConditions => '條款及細則';

  @override
  String get privacyPolicy => '私隱政策';

  @override
  String get faq => '常見問題';

  @override
  String get help => '幫助';

  @override
  String get deleteAccount => '刪除帳戶';

  @override
  String get confirmDeleteAccount => '確定要刪除您的帳戶嗎？';

  @override
  String get accountDeleted => '帳戶已刪除';

  @override
  String get darkMode => '深色模式';

  @override
  String get lightMode => '淺色模式';

  @override
  String get systemDefault => '系統預設';

  @override
  String get notifications => '通知';

  @override
  String get enableNotifications => '啟用通知';

  @override
  String get disableNotifications => '停用通知';

  @override
  String get update => '更新';

  @override
  String get version => '版本';

  @override
  String get newVersionAvailable => '有新版本可用';

  @override
  String get retry => '重試';

  @override
  String get continueText => '繼續';

  @override
  String get settings => '設定';
}
