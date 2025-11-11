import 'package:dio/dio.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';

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
        onRequest: (option, handler) async {
          final token = await PrefHelpers.getToken();
          if (token != null && token.isNotEmpty) {
            option.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(option);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
