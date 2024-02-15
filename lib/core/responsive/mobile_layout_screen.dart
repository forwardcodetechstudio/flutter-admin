import 'package:flutter/material.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';

class MobileLayoutScreen extends StatelessWidget {
  final Widget child;

  const MobileLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      drawer: const AppDrawer(),
      body: child
    );
  }
}
