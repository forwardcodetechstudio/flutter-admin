import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';

class InputBox extends StatelessWidget {
  final String label;
  final String? placeholder;
  final TextEditingController? textEditingController;
  final double labelSpacing;
  final double bottomMargin;
  final double height;
  final Widget? suffixIcon;
  final Function(String value)? onChanged;

  const InputBox({
    super.key,
    this.label = '',
    this.placeholder,
    this.textEditingController,
    this.labelSpacing = 8,
    this.bottomMargin = 10,
    this.height = 36,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const labelTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.blueGreyText,
      fontSize: 15,
      height: 1.5,
    );
    const InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blueGreyText),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: labelTextStyle,
          ),
          labelSpacing.sbh,
        ],
        SizedBox(
          height: height,
          child: TextField(
            controller: textEditingController,
            onChanged: onChanged,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            cursorWidth: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.darkText,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: labelTextStyle,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: border,
              focusedBorder: border.copyWith(
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ),
        bottomMargin.sbh,
      ],
    );
  }
}
