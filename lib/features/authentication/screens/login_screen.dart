import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/base/stateful_page.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/utils/email_validator.dart';
import 'package:flutter_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/widgets/custom_auth_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulPage<AuthBloc> {
  const LoginScreen({super.key});

  @override
  StatefulPageState<AuthBloc> createState() => _LoginScreenState();
}

class _LoginScreenState extends StatefulPageState<AuthBloc> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc..add(AuthInititalEvent()),
      listener: (context, state) {
        if (state is AuthAuthenticationFailed) {
          showAlertSnackBar(
            context,
            state.error,
          );
        } else if (state is AuthAuthenticated) {
          showSnackBar(
            context,
            'Login Successfully',
          );
          context.goNamed(RoutesName.crm);
        } else if (state is AuthUnauthenticated) {
          if (state.isLogout) {
            showSnackBar(
              context,
              'Logout Successfully',
            );
          }
          context.goNamed(RoutesName.login);
        }
      },
      builder: (context, state) {
        final bool isLoading = state is AuthLoading;

        return CustomAuthScaffold(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Log in !',
                  style: TextStyle(
                    color: AppColors.blue0080ff,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                24.sbh,
                CustomTextField(
                  label: 'Enter Email',
                  validator: emailValidator,
                  textEditingController: emailTextEditingController,
                ),
                24.sbh,
                CustomTextField(
                  label: 'Enter Password',
                  textEditingController: passwordTextEditingController,
                ),
                24.sbh,
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
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.goNamed(RoutesName.forgetPassword);
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                24.sbh,
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        AuthLoginEvent(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
                        ),
                      );
                    }
                  },
                  isLoading: isLoading,
                  text: 'Login',
                ),
                12.sbh,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.goNamed(RoutesName.register);
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
      },
    );
  }
}
