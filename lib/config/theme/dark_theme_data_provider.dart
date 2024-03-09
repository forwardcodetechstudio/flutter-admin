import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeDataProvider() {
  return ThemeData.dark().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: AppColors.dark212b36,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dark161c24,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.blue0080ff,
      onPrimary: AppColors.white,
      secondary: AppColors.grey,
      onSecondary: AppColors.black,
      error: AppColors.red,
      onError: AppColors.white,
      background: AppColors.dark161c24,
      onBackground: AppColors.white,
      surface: AppColors.dark212b36,
      onSurface: AppColors.white,
    ),
  );
}
