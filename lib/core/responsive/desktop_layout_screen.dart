import 'package:flutter/material.dart';

class DesktopLayoutScreen extends StatelessWidget {
  final Widget child;

  const DesktopLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Desktop Screen Layout'),
    );
  }
}
