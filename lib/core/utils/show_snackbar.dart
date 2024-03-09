import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

void showSnackbar({
  required BuildContext context,
  required String text,
  Color backgroundColor = AppColors.blue0080ff,
  Color foregroundColor = AppColors.white,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      showCloseIcon: true,
    ),
  );
}
