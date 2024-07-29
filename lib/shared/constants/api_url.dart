class ApiUrl {
  static const String domain = 'http://nina-digital.com';
  // static const String domain = 'http://demo11.ninavietnam.com.vn/nina-digital';
  static const String baseUrl = '$domain/api-app/v1';

  // Authention
  static const String checkToken = '$baseUrl/check-token';
  static const String refreshToken = '$baseUrl/refresh-token';

  static const String allProduct = '$baseUrl/product';
}
