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

class RegisterScreen extends StatefulPage<AuthBloc> {
  const RegisterScreen({super.key});

  @override
  StatefulPageState<AuthBloc> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StatefulPageState<AuthBloc> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conformPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthRegistrationSuccessfull) {
          showSnackBar(
            context,
            state.message,
          );

          context.goNamed(RoutesName.login);
        } else if (state is AuthAuthenticationFailed) {
          showAlertSnackBar(context, state.error,
              backgroundColor: AppColors.red);
        }
      },
      builder: (context, state) {
        final isAuthLoading = state is AuthLoading;
        return CustomAuthScaffold(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                12.sbh,
                Text(
                  'Sign Up!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Enter First Name',
                  textEditingController: _firstNameController,
                  validator: (value) =>
                      (value ?? '').isEmpty ? 'first name is Required' : null,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Enter Last Name',
                  textEditingController: _lastNameController,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Enter Email',
                  textEditingController: _emailController,
                  validator: emailValidator,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Enter Password',
                  textEditingController: _passwordController,
                  validator: (value) =>
                      (value ?? '').isEmpty ? 'password is Required' : null,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: 'Re-Type Password',
                  textEditingController: _conformPasswordController,
                  validator: (value) {
                    if ((value ?? '')
                            .compareTo(_passwordController.text.trim()) !=
                        0) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Flexible(
                      child: Text(
                        'I Agree to Terms & Conditions of Orbiter',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  width: double.infinity,
                  isLoading: isAuthLoading,
                  text: 'Register',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    bloc.add(
                      AuthRegisterEvent(
                        firstName: _firstNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
