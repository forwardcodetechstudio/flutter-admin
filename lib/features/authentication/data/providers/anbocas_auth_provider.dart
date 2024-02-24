import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:http/http.dart' as http;

class AnbocasAuthProvider implements AuthProvider {
  // final Dio dio = Dio();
  final client = http.Client();
  static const String baseUrl = 'dev.anbocas.com';

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final Uri uri = Uri.https(baseUrl, 'api/v1/authenticate');
      final response = await client.post(
        uri,
        body: {'email': email, 'password': password},
      );
      // final Response response = await dio.post(
      //   '$baseUrl/api/v1/authenticate',
      //   data: {'email': email, 'password': password},
      // );
      if (response.statusCode == 200) {
        User user = userFromJson(response.body);
        return user;
      }
    } catch (e) {
      print('Error :::::::::::::::::::::::::::::::::::::::::::');
      print(e);
    }

    return null;
  }

  @override
  Future<User?> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User?> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
