import 'dart:convert';

import 'package:flutter_admin/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  String getStringIn(String key) {
    return _sharedPreferences?.getString(key) ?? "";
  }

  Future<void> setStringIn(String key, dynamic value) {
    return _sharedPreferences!.setString(key, value);
  }

  bool getBoolIn(String key) {
    return _sharedPreferences!.getBool(key) ?? false;
  }

  Future<void> setBoolIn(String key, dynamic value) {
    return _sharedPreferences!.setBool(key, value);
  }

  Future<bool> setLoggedUserValue(User value) async {
    return _sharedPreferences!
        .setString(SharedPrefKeys.user, jsonEncode(value));
  }

  Future<User?> getLoggedUser() async {
    var str = _sharedPreferences?.getString(SharedPrefKeys.user);
    return str != null ? User.fromJson(jsonDecode(str)) : null;
  }

  bool getThemeBool() {
    return _sharedPreferences!.getBool(SharedPrefKeys.theme) ?? true;
  }

  static Future<dynamic> _getInstance() async =>
      _sharedPreferences ?? await SharedPreferences.getInstance();

  Future get instance => _getInstance();
}

class SharedPrefKeys {
  static const String token = "TOKEN";
  static const String theme = "THEME";
  static const String user = "USER";
}
