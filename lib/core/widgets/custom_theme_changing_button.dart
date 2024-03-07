import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomThemeChangingButton extends StatelessWidget {
  const CustomThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final bool isLightThemeActive =
            (state as DefaultTheme).isLightThemeActive;
        return InkWell(
          onTap: () {
            context.read<ThemeBloc>().add(ToogleTheme());
          },
          child: Icon(
            !isLightThemeActive ? Icons.light_mode : Icons.dark_mode,
          ),
        );
      },
    );
  }
}
