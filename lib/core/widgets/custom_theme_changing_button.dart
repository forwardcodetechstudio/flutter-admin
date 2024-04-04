import 'package:flutter/material.dart';
import 'package:flutter_admin/base/stateless_page.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomThemeChangingButton extends StatelessPage<ThemeBloc> {
  CustomThemeChangingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: bloc,
      builder: (context, state) {
        final bool isLightThemeActive =
            (state as DefaultTheme).isLightThemeActive;
        return InkWell(
          onTap: () {
            bloc.add(ToogleTheme());
          },
          child: Icon(
            !isLightThemeActive ? Icons.light_mode : Icons.dark_mode,
          ),
        );
      },
    );
  }
}
