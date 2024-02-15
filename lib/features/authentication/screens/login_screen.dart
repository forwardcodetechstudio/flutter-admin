import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      children: [
        const Text(
          'Log in !',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        const CustomTextField(hintText: 'Enter Username'),
        const SizedBox(height: 24),
        const CustomTextField(hintText: 'Enter Password'),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('Remember Me'),
              ],
            ),
            const Text('Forget Password?'),
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
            child: const Text('Login'),
          ),
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Flexible(
              child: Divider(),
            ),
            Text('  OR  '),
            Flexible(
              child: Divider(),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          children: [
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                style: AppButtonStyles.primaryRGBA,
                label: const Text("Facebook"),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: AppButtonStyles.dangerRGBA,
                icon: const Icon(Icons.g_mobiledata),
                label: const Text("Google"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(text: 'Don\'t have an account? '),
              TextSpan(
                text: 'Sign up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.goNamed(RoutesName.register);
                  },
                style: const TextStyle(
                  color: AppColors.primary,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
