import 'package:flutter/material.dart';
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
    // colors
    final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      tileColor: background,
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
                  style: TextStyle(color: onBackground),
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
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.blue0080ff;
            }
            return AppColors.blue0080ff.withAlpha(26);
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.white;
            }
            return AppColors.blue0080ff;
          }),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Action'),
      ),
    );
  }
}
