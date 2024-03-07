import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTextEditingController =
        TextEditingController();
    final TextEditingController passwordTextEditingController =
        TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print("Auth State  ::::::::::::::::::::::::::::::::::::::::::");
        print(state);
        if (state is AuthAuthenticated) {
          context.goNamed(RoutesName.crm);
        }
        if (state is AuthAuthenticationFailed) {
          showSnackbar(
            context: context,
            text: state.error,
            backgroundColor: AppColors.danger,
          );
        } else if (state is AuthAuthenticated) {
          showSnackbar(
            context: context,
            text: 'Login Successfull',
          );
          context.goNamed(RoutesName.crm);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is AuthLoading;
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthInititalEvent());
        }
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
            CustomTextField(
              label: 'Enter Email',
              textEditingController: emailTextEditingController,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              label: 'Enter Password',
              textEditingController: passwordTextEditingController,
            ),
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
                onPressed: !isLoading
                    ? () {
                        context.read<AuthBloc>().add(
                              AuthLoginEvent(
                                email: emailTextEditingController.text,
                                password: passwordTextEditingController.text,
                              ),
                            );
                      }
                    : null,
                style: AppButtonStyles.success,
                child: !isLoading
                    ? const Text('Login')
                    : const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      ),
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
      },
    );
  }
}
