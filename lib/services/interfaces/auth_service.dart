import 'package:dio/dio.dart';
import 'package:flutter_admin/model/user.dart';
import 'package:flutter_admin/services/impl/auth_service_impl.dart';

abstract class AuthService {
  factory AuthService(Dio client) => AuthServiceImpl(client: client);

  Future<User> login({
    required String email,
    required String password,
  });
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<bool> logout();
}
