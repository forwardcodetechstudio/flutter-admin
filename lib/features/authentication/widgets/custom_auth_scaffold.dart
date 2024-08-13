import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/di/di_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CustomAuthScaffold extends StatelessWidget {
  final Widget child;
  const CustomAuthScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // background image
                SvgPicture.asset(
                  AppImages.authenticationBgSvg,
                  fit: BoxFit.cover,
                ),
                // form
                SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth *
                        0.9, // make container responsive on screen with 41%
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(30),
                    color: Theme.of(context).colorScheme.surface,
                    constraints: const BoxConstraints(
                      maxWidth: 432,
                    ),
                    child: Column(children: [
                      BlocBuilder<ThemeCubit, ThemeState>(
                        bloc: getIt<ThemeCubit>(),
                        builder: (context, state) {
                          return SvgPicture.asset(
                            state is! DarkTheme
                                ? AppImages.fctsBlackTextLogoSvg
                                : AppImages.fctsWhiteTextLogoSvg,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      child,
                    ]),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
