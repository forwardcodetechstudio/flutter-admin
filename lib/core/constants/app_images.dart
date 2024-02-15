import 'package:flutter/material.dart';

@immutable
abstract final class AppImages {
  static const String imageDirPath = 'assets/images'; 
  static const String iconsDirPath = 'assets/icons'; 

  // images 
  static const String authenticationBg = '$imageDirPath/authentication-bg.svg';
  static const String logo = '$imageDirPath/logo.svg';

  // icons
  static const String dashboard = '$iconsDirPath/dashboard.svg';
  static const String pages = '$iconsDirPath/pages.svg';
  static const String collapse = '$iconsDirPath/collapse.svg';
}