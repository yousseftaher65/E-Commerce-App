class EndPoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';
  static const String signin = 'auth/signin';
  static const String signup = 'auth/signup';
  static const String forgotPassword = 'auth/forgotPasswords';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String changeMyPassword = 'users/changeMyPassword';
  static const String resetPassword = 'auth/resetPassword';
  static const String updateMe = 'users/updateMe';
  static const String categories = 'categories';
  static const String subcategories = 'subcategories';
  static const String brands = 'brands';
  static const String products = 'products';
  static const String wishlist = 'wishlist';
  static const String addresses = 'addresses';
  static const String cart = 'cart';
  static const String orders = 'orders/';
  static const String getUserOrders = 'orders/user/';
  static const String checkoutSession = 'orders/checkout-session/';

  static String subcategoriesByCategory (String id) => '$categories/$id/$subcategories';
}