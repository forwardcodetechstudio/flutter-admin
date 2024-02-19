import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final bool collapsed;
  final Widget icon;
  final Widget label;
  final List<Widget>? children;

  const AppDrawerItem({
    super.key,
    this.collapsed = false,
    required this.icon,
    required this.label,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (collapsed) {
      return ListTile(
        title: icon,
        titleAlignment: ListTileTitleAlignment.center,
      );
    }
    if (children == null) {
      return ListTile(
        leading: icon,
        title: label,
      );
    }
    return ExpansionTile(
      leading: icon,
      title: label,
      children: children!,
    );
  }
}
