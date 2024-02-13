import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/responsive/responsive_layout_screen.dart';
import 'package:flutter_admin/features/authentication/screens/login_screen.dart';
import 'package:flutter_admin/features/authentication/screens/register_screen.dart';
import 'package:flutter_admin/features/dashboard/screens/crm_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late GoRouter _router;
  final GlobalKey<NavigatorState> _rootNavigatorState =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorState =
      GlobalKey<NavigatorState>();

  AppRouter() {
    _router = GoRouter(
      routes: _routes(),
      initialLocation: RoutesPath.login,
      navigatorKey: _rootNavigatorState,
    );
  }

  List<RouteBase> _routes() {
    return [
      GoRoute(
        name: RoutesName.login,
        path: RoutesPath.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RoutesName.register,
        path: RoutesPath.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorState,
        builder: (context, state, child) =>
            ResponsiveLayoutScreen(child: child),
        routes: [
          GoRoute(
            name: RoutesName.crm,
            path: RoutesPath.crm,
            builder: (context, state) => const CRMScreen(),
          )
        ],
      )
    ];
  }

  GoRouter get router => _router;
}
