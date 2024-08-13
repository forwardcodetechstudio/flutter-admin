import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class CustomFlashButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final Widget? icon;
  final bool makeIconRight;

  const CustomFlashButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.blue0080ff,
    this.foregroundColor = AppColors.white,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 45,
    this.icon,
    this.makeIconRight = false,
  });

  @override
  Widget build(BuildContext context) {
    // custom flash button style
    final flashButtonStyle = ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return backgroundColor;
        }
        return backgroundColor.withAlpha(26);
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return foregroundColor;
        }
        return backgroundColor;
      }),
    );

    if (icon == null) {
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: flashButtonStyle,
          child: Text(text),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: flashButtonStyle,
      icon: makeIconRight ? Text(text) : icon!,
      label: !makeIconRight ? Text(text) : icon!,
    );
  }
}
