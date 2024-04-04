import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/bloc/light_theme_data_provider.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/config/theme/dark_theme_data_provider.dart';
import 'package:flutter_admin/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: themeBloc,
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Forwardcode',
          debugShowCheckedModeBanner: false,
          theme: lightThemeDataProvider(),
          darkTheme: darkThemeDataProvider(),
          themeMode: (state as DefaultTheme).isLightThemeActive
              ? ThemeMode.light
              : ThemeMode.dark,
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
