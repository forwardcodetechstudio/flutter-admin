import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:flutter_admin/features/authentication/data/providers/anbocas_auth_provider.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_admin/features/company/repositories/companies_repository.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';
import 'package:flutter_admin/core/shared/repositories/remote_categories.dart';
import 'package:flutter_admin/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final SharedPreferences sharedPreferences =
                GetIt.I<SharedPreferences>();
            final String? userJson = sharedPreferences.getString('currentUser');
            print("Current User ::::::::::::::::::::::::::::::::::::::::::");
            print(userJson);
            if (userJson != null) {
              final User currentUser = User.fromJson(json.decode(userJson));
              return AuthBloc(
                authState: AuthAuthenticated(user: currentUser),
                authProvider: AnbocasAuthProvider(
                  client: GetIt.I<NetworkClient>().client,
                ),
              );
            }
            return AuthBloc(
              authState: const AuthUnauthenticated(),
              authProvider: AnbocasAuthProvider(
                client: GetIt.I<NetworkClient>().client,
              ),
            );
          },
        ),
        BlocProvider(create: (context) => ListingBloc()),
        BlocProvider(
          create: (context) => CompaniesBloc(
            companiesRepository: CompaniesRepository(
              client: GetIt.I<NetworkClient>().client,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            RemoteCategory(
              client: GetIt.I<NetworkClient>().client,
            ),
          ),
        ),
        BlocProvider(
          create: (context) {
            return ThemeBloc(
                isLightThemeActive:
                    GetIt.I<SharedPreferences>().getBool('theme') ?? true);
          },
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Admin',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(),
              scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.appBarBackgroundColorLight,
              ),
              listTileTheme: const ListTileThemeData(
                tileColor: AppColors.white,
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(),
              scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.appBarBackgroundColorDark,
              ),
            ),
            themeMode: (state as DefaultTheme).isLightThemeActive
                ? ThemeMode.light
                : ThemeMode.dark,
            routerConfig: GetIt.I<AppRouter>().router,
          );
        },
      ),
    );
  }
}
