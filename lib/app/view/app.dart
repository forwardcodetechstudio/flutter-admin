import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/app_themes.dart';
import 'package:flutter_admin/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_admin/di/di_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: themeBloc,
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Forwardcode Techstudio | Flutter Admin',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state.themeMode,
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
