import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';
import 'package:flutter_admin/core/widgets/mobile_appbar.dart';

class MobileLayoutScreen extends StatelessWidget {
  final Widget child;

  const MobileLayoutScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MobileAppbar(),
        backgroundColor: AppColors.backgroundf2f5fa,
        drawer: const AppDrawer(
          collapsed: false,
        ),
        body: ListView(
          children: [
            Container(
              color: AppColors.white,
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const Text('CRM'),
                  const SizedBox(height: 12),
                  const Text('Home > Dashboard > CRM'),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: AppButtonStyles.primaryRGBA,
                    icon: const Icon(Icons.add),
                    label: const Text('Action'),
                  ),
                ],
              ),
            ),
            const ListTile(
              tileColor: AppColors.white,
              title: Text(
                '© 2020 Orbiter - All Rights Reserved.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
