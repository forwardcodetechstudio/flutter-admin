import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      tileColor: AppColors.white,
      title: Text(
        '© 2020 Orbiter - All Rights Reserved.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
