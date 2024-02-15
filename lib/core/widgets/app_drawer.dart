import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColors.white,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: SvgPicture.asset(AppImages.logo),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.backgroundf2f5fa)),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  ExpansionTile(
                    leading: SvgPicture.asset(
                      AppImages.dashboard,
                      width: 20,
                      height: 20,
                      color: AppColors.grey,
                    ),
                    title: const Text('Dashboard'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - CRM'),
                        onTap: () => context.goNamed(RoutesName.crm),
                      )
                    ],
                  ),
                  ExpansionTile(
                    leading: SvgPicture.asset(
                      AppImages.pages,
                      width: 20,
                      height: 20,
                      color: AppColors.grey,
                    ),
                    title: const Text('Pages'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Login'),
                        onTap: () => context.goNamed(RoutesName.login),
                      ),
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Register'),
                        onTap: () => context.goNamed(RoutesName.register),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
