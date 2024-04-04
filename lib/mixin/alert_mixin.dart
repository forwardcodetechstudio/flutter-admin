import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/context_ext.dart';

mixin AlertMixin {
  void showSnackBar(
    BuildContext context,
    String message, {
    Duration? duration,
    Color backgroundColor = AppColors.blue0080ff,
    Color foregroundColor = AppColors.white,
  }) {
    context.showSnackBar(message, backgroundColor, foregroundColor,
        duration: duration);
  }

  void showAlertSnackBar(
    BuildContext context,
    String message, {
    Duration? duration,
    Color backgroundColor = AppColors.red,
    Color foregroundColor = AppColors.white,
  }) {
    context.showSnackBar(message, backgroundColor, foregroundColor,
        duration: duration);
  }
}
