import 'package:flutter/material.dart';

class MobileLayoutScreen extends StatelessWidget {
  final Widget child;

  const MobileLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Mobile Screen Layout'),
        ],
      ),
    );
  }
}
