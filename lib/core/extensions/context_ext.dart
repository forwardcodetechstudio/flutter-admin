import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showSnackBar(
      String message, Color backgroundColor, Color foregroundColor,
      {Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: foregroundColor,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      showCloseIcon: true,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
