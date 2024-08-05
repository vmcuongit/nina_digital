part of 'dio_client.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.response != null && dioError.response != '') {
      switch (dioError.type) {
        case DioExceptionType.cancel:
          message = 'Request to API server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          message = 'Connection timeout with API server';
          break;
        case DioExceptionType.receiveTimeout:
          message = 'Receive timeout in connection with API server';
          break;
        case DioExceptionType.sendTimeout:
          message = 'Send timeout in connection with API server';
          break;
        case DioExceptionType.unknown:
          message = 'Unexpected error occurred';
          break;
        default:
          message = _handleError(dioError.response?.statusCode,
              dioError.response?.data['message']);
          break;
      }
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print('statusCode: ${dioError.response?.statusCode}');
      print('statusMessage: ${dioError.response?.statusMessage}');
      print('data: ${dioError.response?.data}');
      message =
          'Something happened in setting up or sending the request that triggered an Error';
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
