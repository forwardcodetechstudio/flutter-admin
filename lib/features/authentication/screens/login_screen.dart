import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundf2f5fa,
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              // background image
              SvgPicture.asset(
                AppImages.authenticationBg,
                fit: BoxFit.cover,
              ),
              // login form
              Center(
                child: Container(
                  width: screenWidth*0.9,  // make container responsive on screen with 41%
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(30),
                  constraints: const BoxConstraints(maxWidth: 432),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImages.logo),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
