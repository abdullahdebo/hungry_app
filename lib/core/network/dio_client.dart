import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          final token = 'Abdullah token';
          if (token.isNotEmpty) {
            option.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(option);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
