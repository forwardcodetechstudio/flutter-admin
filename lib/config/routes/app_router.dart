import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/responsive/responsive_layout_screen.dart';
import 'package:flutter_admin/di/injection_container.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/screens/forget_password_screen.dart';
import 'package:flutter_admin/features/authentication/screens/login_screen.dart';
import 'package:flutter_admin/features/authentication/screens/register_screen.dart';
import 'package:flutter_admin/features/company/screens/company_creation_screen.dart';
import 'package:flutter_admin/features/company/screens/company_listing_screen.dart';
import 'package:flutter_admin/features/company/screens/company_updation_screen.dart';
import 'package:flutter_admin/features/dashboard/screens/crm_screen.dart';
import 'package:flutter_admin/features/forms/screens/add_listing_screen.dart';
import 'package:flutter_admin/features/forms/screens/create_update_category_screen.dart';
import 'package:flutter_admin/features/profile/screen/profile_screen.dart';
import 'package:flutter_admin/features/tables/screens/category_screen.dart';
import 'package:flutter_admin/features/tables/screens/listing_screen.dart';
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
      /* Authentication Routes */
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
      GoRoute(
        name: RoutesName.forgetPassword,
        path: RoutesPath.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final AuthState authState = authBloc.state;
          if (authState is AuthUnauthenticated) {
            return state.namedLocation(RoutesName.login);
          }
          return null;
        },
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorState,
            parentNavigatorKey: _rootNavigatorState,
            builder: (context, state, child) {
              return ResponsiveLayoutScreen(child: child);
            },
            routes: [
              /* Dashboard Routes */
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
                builder: (context, state) => ListingScreen(),
              ),

              /* Category Routes */
              GoRoute(
                name: RoutesName.createCategory,
                path: RoutesPath.createCategory,
                builder: (context, state) => CreateUpdateCategoryScreen(),
              ),
              GoRoute(
                name: RoutesName.updateCategory,
                path: RoutesPath.updateCategory,
                builder: (context, state) {
                  final String? categoryId = state.uri.queryParameters['id'];
                  final String? categoryName =
                      state.uri.queryParameters['name'];
                  return CreateUpdateCategoryScreen(
                    categoryId: categoryId,
                    categeoryName: categoryName,
                  );
                },
              ),
              GoRoute(
                name: RoutesName.category,
                path: RoutesPath.category,
                builder: (context, state) => CategoryScreen(),
              ),

              /* SingleCompany Routes */
              GoRoute(
                name: RoutesName.companyListing,
                path: RoutesPath.companyList,
                builder: (context, state) => CompanyListingScreen(),
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

              /* Profile Routes */
              GoRoute(
                path: RoutesPath.profile,
                name: RoutesName.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ];
  }

  GoRouter get router => _router;
}
