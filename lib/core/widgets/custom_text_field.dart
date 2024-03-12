import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? textEditingController;
  final double labelSpacing;
  final double bottomMargin;
  final double height;
  final Widget? suffixIcon;
  final Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    this.label = '',
    this.hintText,
    this.textEditingController,
    this.labelSpacing = 8,
    this.bottomMargin = 10,
    this.height = 36,
    this.suffixIcon,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        label: label.isNotEmpty ? Text(label) : null,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue0080ff),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueGrey8A98AC),
        ),
      ),
    );
  }
}
