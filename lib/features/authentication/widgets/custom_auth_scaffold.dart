import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAuthScaffold extends StatelessWidget {
  final List<Widget> children;
  const CustomAuthScaffold({
    super.key,
    required this.children,
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
                  AppImages.authenticationBg,
                  fit: BoxFit.cover,
                ),
                // form
                SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth *
                        0.9, // make container responsive on screen with 41%
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(30),
                    color: Theme.of(context).colorScheme.background,
                    constraints: const BoxConstraints(
                      maxWidth: 432,
                    ),
                    child: Column(children: [
                      Image.asset(AppImages.fctsLogo),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 24),
                      ...children
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
