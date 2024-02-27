import 'package:flutter_admin/features/authentication/data/models/user.dart';

abstract class AuthProvider {
  Future<User> login({
    required String email,
    required String password,
  });
  Future<User> register();
  Future<bool> logout();
}
