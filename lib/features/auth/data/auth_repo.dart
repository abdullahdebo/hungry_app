import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();

  /// login
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', {
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        if (code != 200 || data == null) {
          throw ApiError(message: msg);
        }
        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  /// Signup
  Future<UserModel?> signup(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await apiService.post('/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code);
        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }
        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// Get Profile data
  Future<UserModel?> getProfileData() async {
    try {
      final response = await apiService.get('/profile');
      return UserModel.fromJson(response['data']);
    } on DioException catch (e) {
      ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
    return null;
  }

  /// update profile data
  Future<UserModel?> updateProfileData({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,
        if (visa != null && visa.isNotEmpty) 'Visa': visa,
        if (imagePath != null && imagePath.isNotEmpty)
          'image': await MultipartFile.fromFile(
            imagePath,
            filename: 'Profile.jpg',
          ),
      });
      final response = await apiService.post(
        '/update-profile',
        formData,
      );
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        final coder = int.tryParse(code);
        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }
        return UserModel.fromJson(data);
      } else {
        throw ApiError(message: 'Invalid Error!');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  /// logout
}
