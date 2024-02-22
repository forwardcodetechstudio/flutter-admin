import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';

class SelectBox extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? textEditingController;
  final double labelSpacing;
  final double bottomMargin;
  final double height;
  final List<DropdownMenuItem<Object>>? options;

  const SelectBox({
    super.key,
    this.label = '',
    this.hint,
    this.textEditingController,
    this.labelSpacing = 2,
    this.bottomMargin = 10,
    this.height = 36,
    this.options,
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
          child: DropdownButtonFormField(
            hint: Text(hint ?? 'Select here'),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey,
                ),
              ),
            ),
            items: options,
            onChanged: (value) {},
          ),
        ),
        bottomMargin.sbh,
      ],
    );
  }
}
