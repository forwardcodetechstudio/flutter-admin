import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

abstract final class AppButtonStyles {
  static final ButtonStyle _baseButtonStyle = ButtonStyle(
    elevation: const MaterialStatePropertyAll(0),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  static final ButtonStyle success = _baseButtonStyle.copyWith(
    backgroundColor: const MaterialStatePropertyAll(AppColors.success),
    foregroundColor:
        const MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
  );
  
  static final ButtonStyle primary= _baseButtonStyle.copyWith(
    backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
    foregroundColor:
        const MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
  );

  static final ButtonStyle primaryIcon = _baseButtonStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.backgroundf2f5fa;
      }
      return AppColors.white;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
      return AppColors.primary;
      }
      return AppColors.grey;
    }),
    iconColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
      return AppColors.primary;
      }
      return AppColors.grey;
    }),
  );

  static final ButtonStyle primaryRGBA = _baseButtonStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.primary;
      }
      return AppColors.primary.withAlpha(26);
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.white;
      }
      return AppColors.primary;
    }),
  );
  static final ButtonStyle dangerRGBA = _baseButtonStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.danger;
      }
      return AppColors.danger.withAlpha(26);
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.white;
      }
      return AppColors.danger;
    }),
  );
}
