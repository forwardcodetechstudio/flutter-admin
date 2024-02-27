import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:dio/dio.dart';

class AnbocasAuthProvider implements AuthProvider {
  final Dio client;

  AnbocasAuthProvider({required this.client});

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final Response response = await client.post(
      '/api/v1/authenticate',
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      User user = User.fromJson(response.data);
      return user;
    }

    throw InvalidCredential();
  }

  @override
  Future<bool> logout() async {
    try {
      final Response response = await client.post('/api/v1/logout');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw LogoutFailure();
    }
  }

  @override
  Future<User> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
