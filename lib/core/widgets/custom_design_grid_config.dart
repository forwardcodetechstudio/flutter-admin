import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/screen_breakpoints.dart';

class CustomDesignGridConfig extends StatelessWidget {
  final Widget child;

  const CustomDesignGridConfig({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesignGridConfig(
      breakpoints: const ResponsiveDesignGridBreakpoints(
        small: ScreenBreakpoints.small,
        medium: ScreenBreakpoints.medium,
        large: ScreenBreakpoints.large,
        extraLarge: ScreenBreakpoints.extraLarge,
      ),
      child: child,
    );
  }
}
