import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double width;
  final double height;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.blue0080ff,
    this.foregroundColor = AppColors.white,
    this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : () {},
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          foregroundColor: MaterialStatePropertyAll(foregroundColor),
        ),
        child: !isLoading
            ? Text(text)
            : SizedBox(
                width: 27,
                height: 27,
                child: CircularProgressIndicator(
                  color: foregroundColor,
                  strokeWidth: 3,
                ),
              ),
      ),
    );
  }
}
