import 'package:design_grid/design_grid.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/di/di_injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // colors
    final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;

    const ResponsiveDesignGridColumns inputFieldGridColumns =
        ResponsiveDesignGridColumns(small: 12, medium: 6);

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          final currentUser = state.user;
          final firstName = currentUser.user!.firstName;
          final lastName = currentUser.user!.lastName;
          final email = currentUser.user!.email;
          final phone = currentUser.user!.phone ?? '';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppBreadCrumbs(locationName: RoutesName.profile),
                24.sbh,
                ResponsiveDesignGrid(
                  useOuterPadding: false,
                  children: [
                    ResponsiveDesignGridRow(
                      children: [
                        ResponsiveDesignGridItem(
                          columns: const ResponsiveDesignGridColumns(
                            small: 12,
                            large: 4,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            color: background,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://media.istockphoto.com/id/1327592506/vector/default-avatar-photo-placeholder-icon-grey-profile-picture-business-man.jpg?s=612x612&w=0&k=20&c=BpR0FVaEa5F24GIw7K8nMWiiGmbb8qmhfkpXcp1dhQg=',
                                      width: 160,
                                      height: 160,
                                    ),
                                  ),
                                ),
                                14.sbh,
                                Text(
                                  '$firstName $lastName',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: onBackground,
                                  ),
                                ),
                                Text(
                                  '$email',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveDesignGridItem(
                          columns: const ResponsiveDesignGridColumns(
                            small: 12,
                            large: 8,
                          ),
                          child: Container(
                              color: background,
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: ResponsiveDesignGrid(
                                useOuterPadding: true,
                                children: [
                                  ResponsiveDesignGridRow(
                                    children: [
                                      ResponsiveDesignGridItem(
                                        columns: inputFieldGridColumns,
                                        child: CustomTextField(
                                          label: 'First Name',
                                          initialValue: '$firstName',
                                          enabled: false,
                                        ),
                                      ),
                                      ResponsiveDesignGridItem(
                                        columns: inputFieldGridColumns,
                                        child: CustomTextField(
                                          label: 'Last Name',
                                          initialValue: '$lastName',
                                          enabled: false,
                                        ),
                                      ),
                                      ResponsiveDesignGridItem(
                                        columns: inputFieldGridColumns,
                                        child: CustomTextField(
                                          label: 'Email',
                                          initialValue: '$email',
                                          enabled: false,
                                        ),
                                      ),
                                      ResponsiveDesignGridItem(
                                        columns: inputFieldGridColumns,
                                        child: CustomTextField(
                                          label: 'Phone',
                                          initialValue: '$phone',
                                          enabled: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return RichText(
          text: TextSpan(
            text: 'Somthing went wrong,',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.goNamed(RoutesName.crm);
                  },
                text: 'Back to Dashboard',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        );
      },
    );
  }
}
