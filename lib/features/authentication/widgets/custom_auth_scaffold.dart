import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
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
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        color: AppColors.backgroundf2f5fa,
        width: screenWidth,
        height: screenHeight,
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
                width: screenWidth *
                    0.9, // make container responsive on screen with 41%
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(30),
                constraints: const BoxConstraints(
                  maxWidth: 432,
                ),
                color: AppColors.white,
                child: Column(children: [
                  SvgPicture.asset(AppImages.logo),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 24),
                  ...children
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
