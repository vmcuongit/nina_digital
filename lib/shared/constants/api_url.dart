class ApiUrl {
  static const String domain = 'http://nina-digital.com';
  // static const String domain = 'http://demo11.ninavietnam.com.vn/nina-digital';

  static const String baseUrl = '$domain/api-app/v1';

  // Media
  static const String uploadUser = '$domain/upload/user';
  static const String uploadPhoto = '$domain/upload/photo';
  static const String uploadProduct = '$domain/upload/product';
  static const String uploadNews = '$domain/upload/news';
  static const String uploadImage = '$domain/upload/images';

  // Authention
  static const String checkToken = '$baseUrl/token/check';
  static const String refreshToken = '$baseUrl/token/refresh';
  static const String signIn = '$baseUrl/account/sign-in';
  static const String signUp = '$baseUrl/account/sign-up';
  static const String forgotPassword = '$baseUrl/account/forgot-password';

  static const String allProduct = '$baseUrl/product';

  static const String address = '$baseUrl/address';
}
