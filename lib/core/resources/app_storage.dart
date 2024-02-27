import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AppStorage();

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'accessToken');
  }
  
  void setAccessToken({required String token}) async {
    await _secureStorage.write(key: 'accessToken', value: token);
  }

  void removeAccessToken() async {
    await _secureStorage.delete(key: 'accessToken');
  }
}
