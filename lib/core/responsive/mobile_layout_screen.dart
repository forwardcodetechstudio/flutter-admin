import 'package:flutter/material.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';
import 'package:flutter_admin/core/widgets/mobile_appbar.dart';

class MobileLayoutScreen extends StatelessWidget {
  final Widget child;

  const MobileLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MobileAppbar(),
      drawer: const AppDrawer(
        collapsed: false,
      ),
      body: child,
    );
  }
}
