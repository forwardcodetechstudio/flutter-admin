import 'dart:io';

import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/model/user.dart';
import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:dio/dio.dart';

class AuthServiceImpl implements AuthService {
  final Dio client;

  AuthServiceImpl({required this.client});

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
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await client.post('/api/v1/users/create', data: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }
}
