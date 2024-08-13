import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final bool collapsed;
  final Widget icon;
  final Widget label;
  final List<Widget>? children;
  final VoidCallback? onTap;

  const AppDrawerItem({
    super.key,
    this.collapsed = false,
    required this.icon,
    required this.label,
    this.children, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (collapsed) {
      return ListTile(
        title: icon,
        titleAlignment: ListTileTitleAlignment.center,
        onTap: onTap,
      );
    }
    if (children == null) {
      return ListTile(
        leading: icon,
        title: label,
        onTap: onTap,
      );
    }
    return ExpansionTile(
      leading: icon,
      title: label,
      children: children!,
    );
  }
}
