// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';

class SelectBox<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? textEditingController;
  final double labelSpacing;
  final double bottomMargin;
  final double height;
  final List<T> options;
  final Function(T? value)? onChanged;

  const SelectBox({
    Key? key,
    this.label = '',
    this.hint,
    this.textEditingController,
    this.labelSpacing = 8,
    this.bottomMargin = 10,
    this.height = 36,
    this.options = const [],
    this.onChanged,
  }) : super(key: key);

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
    const InputBorder focusBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: AppColors.primary,
    ));
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
          child: DropdownSearch<T>(
            items: options,
            onChanged: onChanged,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hint ?? 'Select here',
                hintStyle: labelTextStyle,
                border: border,
                focusedBorder: focusBorder,
              ),
            ),
          ),
        ),
        bottomMargin.sbh,
      ],
    );
  }
}
