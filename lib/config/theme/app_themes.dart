import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppThemes {
  static get lightTheme => ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.whitef2f5fa,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        listTileTheme: const ListTileThemeData(
          tileColor: AppColors.white,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.blue0080ff,
          onPrimary: AppColors.white,
          secondary: AppColors.grey,
          onSecondary: AppColors.black,
          error: AppColors.red,
          onError: AppColors.white,
          onBackground: AppColors.black,
          surface: AppColors.white,
          onSurface: AppColors.blueGrey93b4d4,
        ),
      );

  static get darkTheme => ThemeData.dark().copyWith(
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
          onBackground: AppColors.white,
          surface: AppColors.dark161c24,
          onSurface: AppColors.blueGrey8A98AC,
        ),
      );
}
