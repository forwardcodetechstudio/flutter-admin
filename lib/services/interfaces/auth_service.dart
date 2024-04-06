import 'package:flutter_admin/networking/api_response.dart';

abstract class AuthService {
  // factory AuthService(Dio client) => AuthServiceImpl(client: client);

  Future<ApiResponse> login({
    required String email,
    required String password,
  });

  Future<ApiResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<ApiResponse> logout();
}
