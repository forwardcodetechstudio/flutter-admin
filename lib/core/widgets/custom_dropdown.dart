import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SelectBox<T> extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? textEditingController;
  final double labelSpacing;
  final double bottomMargin;
  final double height;
  final List<T> options;
  final Function(T? value)? onChanged;

  const SelectBox({
    Key? key,
    this.label = '',
    this.hintText,
    this.textEditingController,
    this.labelSpacing = 8,
    this.bottomMargin = 10,
    this.height = 36,
    this.options = const [],
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: options,
      onChanged: onChanged,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        dropdownSearchDecoration: InputDecoration(
          hintText: hintText ?? 'Select here',
          label: Text(label),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
