import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/responsive/responsive_layout_screen.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/screens/login_screen.dart';
import 'package:flutter_admin/features/authentication/screens/register_screen.dart';
import 'package:flutter_admin/features/company/screens/company_creation_screen.dart';
import 'package:flutter_admin/features/company/screens/company_listing_screen.dart';
import 'package:flutter_admin/features/company/screens/company_updation_screen.dart';
import 'package:flutter_admin/features/dashboard/screens/crm_screen.dart';
import 'package:flutter_admin/features/forms/screens/add_listing_screen.dart';
import 'package:flutter_admin/features/forms/screens/create_update_category_screen.dart';
import 'package:flutter_admin/features/tables/screens/category_screen.dart';
import 'package:flutter_admin/features/tables/screens/listing_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      redirect: (context, state) {
        final AuthState authState = context.read<AuthBloc>().state;
        if (authState is AuthUnauthenticated) {
          return state.namedLocation(RoutesName.login);
        }

        return null;
      },
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
        parentNavigatorKey: _rootNavigatorState,
        builder: (context, state, child) {
          return ResponsiveLayoutScreen(child: child);
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

          /* Category Routes */
          GoRoute(
            name: RoutesName.createCategory,
            path: RoutesPath.createCategory,
            builder: (context, state) => const CreateUpdateCategoryScreen(),
          ),
          GoRoute(
            name: RoutesName.updateCategory,
            path: RoutesPath.updateCategory,
            builder: (context, state) {
              final String? categoryId = state.uri.queryParameters['id'];
              final String? categoryName = state.uri.queryParameters['name'];
              return CreateUpdateCategoryScreen(
                categoryId: categoryId,
                categeoryName: categoryName,
              );
            },
          ),
          GoRoute(
            name: RoutesName.category,
            path: RoutesPath.category,
            builder: (context, state) => const CategoryScreen(),
          ),

          /* Company Routes */
          GoRoute(
            name: RoutesName.companyListing,
            path: RoutesPath.companyList,
            builder: (context, state) => const CompanyListingScreen(),
          ),
          GoRoute(
            name: RoutesName.createNewCompany,
            path: RoutesPath.createNewCompany,
            builder: (context, state) => const CompanyCreationScreen(),
          ),
          GoRoute(
            name: RoutesName.updateCompany,
            path: RoutesPath.updateCompany,
            builder: (context, state) => const CompanyUpdationScreen(),
          ),
        ],
      ),
    ];
  }

  GoRouter get router => _router;
}
