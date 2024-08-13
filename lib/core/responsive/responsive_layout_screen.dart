import 'package:flutter/material.dart';
import 'package:flutter_admin/base/stateless_page.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/responsive/desktop_layout_screen.dart';
import 'package:flutter_admin/core/responsive/mobile_layout_screen.dart';
import 'package:flutter_admin/core/responsive/screen_sizes.dart';
import 'package:flutter_admin/core/widgets/custom_design_grid_config.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResponsiveLayoutScreen extends StatelessPage<AuthBloc> {
  final Widget child;

  ResponsiveLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.goNamed(RoutesName.login);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < ScreenSizes.mobile) {
              return MobileLayoutScreen(
                child: CustomDesignGridConfig(
                  child: child,
                ),
              );
            } else {
              return DesktopLayoutScreen(
                content: CustomDesignGridConfig(
                  child: child,
                ),
              );
            }
          },
        );
      },
    );
  }
}
