import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/utils/email_validator.dart';
import 'package:flutter_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            12.sbh,
            const Text(
              'Forgot Password ?',
              style: TextStyle(
                color: AppColors.blue0080ff,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            12.sbh,
            const Text(
              'Enter the email address below to receive reset password instructions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.blueGrey8A98AC,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            12.sbh,
            const CustomTextField(
              hintText: 'Enter Email',
              validator: emailValidator,
            ),
            24.sbh,
            CustomElevatedButton(
              onPressed: () {},
              text: 'Send Email',
            ),
            12.sbh,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Remember Password? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.goNamed(RoutesName.login);
                      },
                    style: const TextStyle(
                      color: AppColors.blue0080ff,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
