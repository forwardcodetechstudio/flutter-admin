import 'package:flutter/foundation.dart';

class LoggerUtils {
  void info(String message) {
    if (kDebugMode) {
      print('=====>> \x1B[34m$message\x1B[0m');
    }
  }

  void error(String message) {
    if (kDebugMode) {
      print('=====>> \x1B[31m$message\x1B[0m');
    }
  }

  void warning(String message) {
    if (kDebugMode) {
      print('=====>> \x1B[33m$message\x1B[0m');
    }
  }
}
