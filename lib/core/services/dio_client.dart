import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import 'jwt_encoder.dart';

part 'dio_exceptions.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient(Dio());
});

class DioClient {
  // dio instance
  final Dio _dio;
  Options? _options;
  Options? _optionsDownload;

  // injecting dio instance
  DioClient(this._dio) {
    _dio
      ..options.baseUrl = ApiUrl.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json;
  }

  // Future<Response> generateToken() async {
  //   final Response response = await _dio.post(ApiUrl.generateToken,
  //       data: FormData.fromMap(
  //           {'email': AppConstants.email, 'secret': AppConstants.secret}));
  //   return response;
  // }

  // void initOptions() {
  //   // String? token = App.providerContainer.read(authRepositoryProvider).token;
  //   String token = '';
  //   _options = null;
  //   _optionsDownload = null;
  //   if (token.isNotEmpty && token != '') {
  //     _options = Options(headers: {
  //       "Authorization": "Bearer $token",
  //     });
  //     _optionsDownload = Options(
  //       headers: {
  //         "Authorization": "Bearer $token",
  //       },
  //       responseType: ResponseType.bytes,
  //     );
  //   }
  // }

  String _getAPIToken({required timeAction, required dynamic data}) {
    Map<String, dynamic> payload = {};
    if (data != null && data != '') {
      payload = data;
    }
    payload['timeAction'] = timeAction;
    final JwtEncoder jwtEncoder = JwtEncoder(secretKey: AppConfig.secretKey);
    return jwtEncoder.encode(payload);
  }

  String _getUserToken() {
    return '';
  }

  Options _customOptions({required String url, required dynamic data}) {
    int timeNow = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;

    // Authentication API
    String apiToken = _getAPIToken(timeAction: timeNow, data: data);

    // Headers
    Map<String, dynamic> headers = {
      'timeAction': timeNow,
      'API-Validation': apiToken,
      // 'Authorization': 'Bearer $token',
    };

    // Authentication User Login
    if (AppConfig.mustLogin) {
      String userToken = _getUserToken();
      if (userToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $userToken';
      }
    }

    // DEBUG
    if (AppConfig.production == false) {
      Map<String, dynamic> debugHeaders = headers;
      debugHeaders['url'] = url;
      debugHeaders.remove('timeAction');
      AppConfig.logger.d(debugHeaders);
    }

    return Options(headers: headers);
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _customOptions(url: url, data: null),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: _customOptions(url: uri, data: data),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: _customOptions(url: uri, data: data),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: _customOptions(url: uri, data: data),
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
