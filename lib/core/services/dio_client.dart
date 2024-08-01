import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import '../authentication_user/providers/auth_user_provider.dart';
import 'jwt_encoder.dart';

part 'dio_exceptions.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient(Dio(), ref);
});

class DioClient {
  final Dio _dio; // dio instance
  final Ref _ref;

  // injecting dio instance
  DioClient(this._dio, this._ref) {
    // Lưu trữ header cũ
    RequestOptions? previousOptions;
    _dio
      ..options.baseUrl = ApiUrl.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            String accessToken =
                await _ref.read(authUserProvider.notifier).getAccessToken();

            options.headers = _customHeaders(
                url: options.path,
                data: options.data,
                accessToken: accessToken);
            previousOptions = options;
            return handler.next(options);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 401) {
              // Refresh token
              String accessToken = await _ref
                  .read(authUserProvider.notifier)
                  .refreshAccessToken(typeString: true);
              // Retry request với token mới
              RequestOptions newOptions = previousOptions!;
              newOptions.headers['Authorization'] = 'Bearer $accessToken';
              final response = await _dio.request(error.requestOptions.path,
                  options: newOptions as Options);
              print(response);
              return handler.resolve(response);
            }
            return handler.next(error);
          },
        ),
      );
  }

  String _getAPIToken({required timeAction, required dynamic data}) {
    Map<String, dynamic> payload = {};
    if (data != null && data != '') {
      payload = Map.from(data);
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
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
