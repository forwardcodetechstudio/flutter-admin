import 'package:flutter/material.dart';
import 'package:flutter_admin/core/responsive/desktop_layout_screen.dart';
import 'package:flutter_admin/core/responsive/mobile_layout_screen.dart';
import 'package:flutter_admin/core/responsive/screen_sizes.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget child;

  const ResponsiveLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ScreenSizes.mobile) {
          return MobileLayoutScreen(child: child);
        }
      else {
          return DesktopLayoutScreen(child: child);
        }
      },
    );
  }
}
