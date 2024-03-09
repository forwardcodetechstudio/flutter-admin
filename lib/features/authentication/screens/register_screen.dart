import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(children: [
      Text(
        'Sign Up!',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 24),
      const CustomTextField(label: 'Enter Username'),
      const SizedBox(height: 24),
      const CustomTextField(label: 'Enter Email'),
      const SizedBox(height: 24),
      const CustomTextField(label: 'Enter Password'),
      const SizedBox(height: 24),
      const CustomTextField(label: 'Re-Type Password'),
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
      const CustomElevatedButton(
        width: double.infinity,
        text: 'Register',
      ),
      const SizedBox(height: 24),
      RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Log in',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed(RoutesName.login);
                },
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
