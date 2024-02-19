import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart';

class AppBreadCrumbs extends StatelessWidget {
  final String locationName;

  const AppBreadCrumbs({
    super.key,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      title: const Text('CRM'),
      subtitle: Text(
        GoRouter.of(context).namedLocation(locationName).replaceAll('/', ' > '),
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
