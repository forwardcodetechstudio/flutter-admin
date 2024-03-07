import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:go_router/go_router.dart';

class AppBreadCrumbs extends StatelessWidget {
  final String locationName;

  const AppBreadCrumbs({
    super.key,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    final paths = GoRouter.of(context).namedLocation(locationName).split('/');
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final bool isLightThemeActive =
            (state as DefaultTheme).isLightThemeActive;
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
          shape: Border.all(color: AppColors.white),
          title: Text(
            locationName.toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: BreadCrumb(
            items: paths
                .map(
                  (e) => BreadCrumbItem(
                    margin: const EdgeInsets.only(right: 8),
                    content: Text(
                      e,
                      style: TextStyle(
                        color: isLightThemeActive
                            ? AppColors.black
                            : AppColors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
            divider: const Icon(
              Icons.arrow_back_ios,
              size: 12,
            ),
          ),
          trailing: ElevatedButton.icon(
            onPressed: () {},
            style: AppButtonStyles.primaryRGBA,
            icon: const Icon(Icons.add),
            label: const Text('Action'),
          ),
        );
      },
    );
  }
}
