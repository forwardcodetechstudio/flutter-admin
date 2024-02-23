import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/responsive/responsive_layout_screen.dart';
import 'package:flutter_admin/features/authentication/screens/login_screen.dart';
import 'package:flutter_admin/features/authentication/screens/register_screen.dart';
import 'package:flutter_admin/features/dashboard/screens/crm_screen.dart';
import 'package:flutter_admin/features/forms/screens/add_listing_screen.dart';
import 'package:flutter_admin/features/tables/bloc/listing_bloc.dart';
import 'package:flutter_admin/features/tables/screens/listing_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
        builder: (context, state, child) {
          // Check ListingBloc is registered or not, registered it if not
          if (!GetIt.I.isRegistered<ListingBloc>()) {
            GetIt.instance.registerSingleton<ListingBloc>(ListingBloc());
          }
          return ResponsiveLayoutScreen(
              child: BlocProvider(
            create: (context) => GetIt.I<ListingBloc>(),
            child: child,
          ));
        },
        routes: [
          GoRoute(
            name: RoutesName.crm,
            path: RoutesPath.crm,
            builder: (context, state) => const CRMScreen(),
          ),
          GoRoute(
            name: RoutesName.addListing,
            path: RoutesPath.addListing,
            builder: (context, state) => const AddListingScreen(),
          ),
          GoRoute(
            name: RoutesName.listing,
            path: RoutesPath.listing,
            builder: (context, state) => const ListingScreen(),
          ),
        ],
      ),
    ];
  }

  GoRouter get router => _router;
}
