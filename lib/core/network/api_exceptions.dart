import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic> &&
        data['message'] != null) {
      return ApiError(
        message: data['message'],
        statusCode: statusCode,
      );
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: ' Connection Timed Out');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Request Timed Out');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Response Timed Out');
      default:
        return ApiError(
          message:
              'Unexpected Error Occurred. Please try again later.',
        );
    }
  }
}
