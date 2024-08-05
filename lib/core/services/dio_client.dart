import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';
import '../../shared/constants/api_url.dart';
import '../authentication_user/providers/auth_user_provider.dart';
import 'jwt_encoder.dart';

part 'auth_interceptors.dart';
part 'dio_exceptions.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient(Dio(), ref);
});

class DioClient {
  final Dio _dio; // dio instance
  final Ref _ref;

  // injecting dio instance
  DioClient(this._dio, this._ref) {
    _dio
      ..options.baseUrl = ApiUrl.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json
      ..interceptors.add(AuthUserInterceptor(_dio, _ref));
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
      return _responseError(
          statusCode: e.response?.statusCode,
          statusMessage: errorMessage,
          data: e.response?.data);
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
      return _responseError(
          statusCode: e.response?.statusCode,
          statusMessage: errorMessage,
          data: e.response?.data);
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
      return _responseError(
          statusCode: e.response?.statusCode,
          statusMessage: errorMessage,
          data: e.response?.data);
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
      return _responseError(
          statusCode: e.response?.statusCode,
          statusMessage: errorMessage,
          data: e.response?.data);
    }
  }

  Response _responseError(
      {int? statusCode, String? statusMessage, dynamic data}) {
    // if (statusCode == 401) {
    //   _ref.read(authUserProvider.notifier).signOut();
    // }
    return Response(
        statusCode: statusCode,
        statusMessage: statusMessage,
        data: data,
        requestOptions: RequestOptions());
  }
}
