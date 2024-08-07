class ApiUrl {
  static const String website = 'https://vikof.kr';

  // static const String domain = 'http://nina-digital.com';
  static const String domain = 'http://demo11.ninavietnam.com.vn/nina-digital';

  static const String baseUrl = '$domain/api-app/v1';

  // Media
  static const String uploadUser = '$website/upload/user';
  static const String uploadPhoto = '$website/upload/photo';
  static const String uploadProduct = '$website/upload/product';
  static const String uploadNews = '$website/upload/news';
  static const String uploadImage = '$website/upload/images';

  static const String thumbProduct =
      '$website/watermark/product/520x520x2/upload/product';

  // Authention
  static const String checkToken = '$baseUrl/token/check';
  static const String refreshToken = '$baseUrl/token/refresh';
  static const String signIn = '$baseUrl/account/sign-in';
  static const String signUp = '$baseUrl/account/sign-up';
  static const String forgotPassword = '$baseUrl/account/forgot-password';

  static const String allProduct = '$baseUrl/product';

  static const String address = '$baseUrl/address';
}
