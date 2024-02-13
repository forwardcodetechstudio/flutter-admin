import 'package:flutter/material.dart';

class MobileLayoutScreen extends StatelessWidget {
  final Widget child;

  const MobileLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Mobile Screen Layout'),
        child,
      ]),
    );
  }
}
