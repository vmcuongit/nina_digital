part of 'dio_client.dart';

class AuthUserInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final Ref _ref;

  // Lưu trữ header cũ
  RequestOptions? previousOptions;

  AuthUserInterceptor(this._dio, this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String accessToken = _ref.read(authUserProvider.notifier).getAccessToken();
    final cusHeaders = _customHeaders(
        url: options.path, data: options.data, accessToken: accessToken);

    options.headers = cusHeaders;

    previousOptions = options;

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Refresh token
      String accessToken = await _ref
          .read(authUserProvider.notifier)
          .refreshAccessToken(typeString: true);

      // Retry request với token mới
      Options newOptions = Options(
        headers: previousOptions?.headers,
      );
      newOptions.headers?['Authorization'] = 'Bearer ${accessToken.toString()}';

      final response =
          await _dio.request(err.requestOptions.path, options: newOptions);
      if (response.statusCode != 200) {
        _ref.read(authUserProvider.notifier).signOut();
      }
      return handler.resolve(response);
    }
    super.onError(err, handler);
  }

  String _getAPIToken({required timeAction, required dynamic data}) {
    Map<String, dynamic> payload = {};
    if (data != null && data != '') {
      payload = data;
    }
    payload['timeAction'] = timeAction.toString();
    final JwtEncoder jwtEncoder = JwtEncoder(secretKey: AppConfig.secretKey);
    return jwtEncoder.encode(payload);
  }

  Map<String, dynamic>? _customHeaders(
      {required String url, required dynamic data, String accessToken = ''}) {
    int timeNow = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;

    // Authentication API
    String apiToken = _getAPIToken(timeAction: timeNow, data: data);

    // Headers
    Map<String, dynamic> headers = {
      'timeAction': timeNow,
      'API-Token': apiToken,
    };

    if (accessToken != '' && accessToken.isNotEmpty && accessToken != 'null') {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    // DEBUG
    if (AppConfig.production == false) {
      Map<String, dynamic> debugHeaders = headers;
      debugHeaders['url'] = url;
      debugHeaders.remove('timeAction');
      AppConfig.logger.d(debugHeaders);
    }

    return headers;
  }
}
