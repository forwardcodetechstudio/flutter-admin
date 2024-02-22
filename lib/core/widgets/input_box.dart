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

  const InputBox({
    super.key,
    this.label = '',
    this.placeholder,
    this.textEditingController,
    this.labelSpacing = 2,
    this.bottomMargin = 10,
    this.height = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label),
          labelSpacing.sbh,
        ],
        SizedBox(
          height: height,
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: placeholder,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
            ),
          ),
        ),
        bottomMargin.sbh,
      ],
    );
  }
}
