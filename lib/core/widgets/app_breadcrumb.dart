import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      title: Text(locationName.toUpperCase()),
      subtitle: BreadCrumb(
        items: paths
            .map(
              (e) => BreadCrumbItem(
                margin: const EdgeInsets.only(right: 8),
                content: Text(e),
              ),
            )
            .toList(),
        divider: const Icon(
          Icons.arrow_back_ios,
          size: 12,
        ),
      ),
      tileColor: AppColors.white,
      trailing: ElevatedButton.icon(
        onPressed: () {},
        style: AppButtonStyles.primaryRGBA,
        icon: const Icon(Icons.add),
        label: const Text('Action'),
      ),
    );
  }
}
