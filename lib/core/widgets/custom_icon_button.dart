import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final BoxShape shape;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.width = 27,
    this.height = 27,
    this.backgroundColor = Colors.transparent,
    this.padding,
    this.margin,
    this.shape = BoxShape.circle,
    this.border,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape,
          border: border,
          borderRadius: borderRadius,
        ),
        child: icon,
      ),
    );
  }
}
