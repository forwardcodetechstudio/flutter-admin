import 'package:flutter_admin/model/user.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/networking/api_error.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:dio/dio.dart';

class AuthServiceImpl extends AuthService {
  final ApiService apiService;

  AuthServiceImpl(this.apiService);

  @override
  Future<ApiResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await apiService.post(
        '/api/v1/authenticate',
        data: {'email': email, 'password': password},
      );

      if (response.data != null) {
        User user = User.fromJson(response.data);
        return ApiResponse(data: user);
      } else {
        return ApiResponse(error: ApiError(message: "Unable to get user data"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: ApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> logout() async {
    try {
      final Response response = await apiService.post('/api/v1/logout');
      return ApiResponse(data: response);
    } on Exception catch (e) {
      return ApiResponse(error: ApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post('/api/v1/users/create', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
      });
      return ApiResponse(data: response);
    } on Exception catch (e) {
      return ApiResponse(error: ApiError(e: e));
    }
  }
}
