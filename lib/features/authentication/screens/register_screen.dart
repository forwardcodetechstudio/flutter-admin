import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(children: [
      const Text(
        'Sign Up!',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 24),
      const CustomTextField(hintText: 'Enter Username'),
      const SizedBox(height: 24),
      const CustomTextField(hintText: 'Enter Email'),
      const SizedBox(height: 24),
      const CustomTextField(hintText: 'Enter Password'),
      const SizedBox(height: 24),
      const CustomTextField(hintText: 'Re-Type Password'),
      const SizedBox(height: 24),
      Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          const Flexible(
            child: Text(
              'I Agree to Terms & Conditions of Orbiter',
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
      const SizedBox(height: 24),
      SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(RoutesName.crm);
          },
          style: AppButtonStyles.success,
          child: const Text('Register'),
        ),
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
          ),
          InkWell(
            onTap: () {
              context.goNamed(RoutesName.login);
            },
            child: const Text(
              'Log in',
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
