import 'package:flutter_admin/features/authentication/data/models/user.dart';

abstract class AuthProvider {
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
