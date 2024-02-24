import 'package:dio/dio.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:http/http.dart' as http;

class AnbocasAuthProvider implements AuthProvider {
  // final Dio dio = Dio();
  final client = http.Client();
  static const String baseUrl = 'https://dev.anbocas.com';

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {

    final response = await client.post(
      Uri.https(baseUrl, 'api/v1/authenticate'),
      body: {'email': email, 'password': password}, 
    );
    // final Response response = await dio.post(
    //   '$baseUrl/api/v1/authenticate',
    //   data: {'email': email, 'password': password},
    // );

    print("Response :::::::::::::::::::::::::::::::::::");
    print(response);
    // if (response.statusCode == 200) {
    //   User user = userFromJson(response.body);
    //   print("USER :::::::::::::::::::::::::::::::::::::::::::::::::::::::");
    //   print(user);
    //   return user
    // }
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
