import 'package:dio/dio.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import 'jwt_encoder.dart';

part 'dio_exceptions.dart';

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
  //   String? token = App.providerContainer.read(authRepositoryProvider).token;
  //   _options = null;
  //   _optionsDownload = null;
  //   if (token != null && token != '') {
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

  Options _customOptions(dynamic data) {
    var timeNow = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    Map<String, dynamic> payload = {};
    if (data != null && data != '') {
      payload = data;
    }
    payload['timeAction'] = timeNow;
    final JwtEncoder jwtEncoder = JwtEncoder(secretKey: AppConfig.secretKey);
    var token = jwtEncoder.encode(payload);
    // print(payload);
    // print({
    //   'timeAction': timeNow,
    //   'Authorization': 'Bearer $token',
    // });
    return Options(headers: {
      'timeAction': timeNow,
      'Authorization': 'Bearer $token',
    });
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
        options: _customOptions(null),
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
        options: _customOptions(data),
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
        options: _customOptions(data),
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
        options: _customOptions(data),
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
