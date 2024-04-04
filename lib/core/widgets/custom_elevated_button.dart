import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Widget? textWidget;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double width;
  final double height;
  const CustomElevatedButton({
    Key? key,
    this.text,
    this.textWidget,
    this.backgroundColor = AppColors.blue0080ff,
    this.foregroundColor = AppColors.white,
    this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 45,
  })  : assert(text != null || textWidget != null,
            'Either text or textWidget must be provided.'),
        super(key: key);

  Widget _renderCenterWidget() {
    if (text != null) {
      return Text(text!);
    } else if (textWidget != null) {
      return textWidget!;
    } else {
      return const SizedBox();
    }
  }

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
            ? _renderCenterWidget()
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
