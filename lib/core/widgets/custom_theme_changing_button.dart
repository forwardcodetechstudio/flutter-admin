import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_admin/di/di_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomThemeChangingButton extends StatelessWidget {
  const CustomThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: getIt<ThemeCubit>(),
      builder: (context, state) {
        final bool isLightThemeActive = state is! DarkTheme;
        return InkWell(
          onTap: () {
            getIt<ThemeCubit>().changeTheme(
                isLightThemeActive ? ThemeMode.dark : ThemeMode.light);
          },
          child: Icon(
            !isLightThemeActive ? Icons.light_mode : Icons.dark_mode,
          ),
        );
      },
    );
  }
}
