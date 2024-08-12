import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/widgets/app_drawer_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final bool collapsed;
  const AppDrawer({
    super.key,
    this.collapsed = true,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: collapsed ? 100 : null,
      shape: const RoundedRectangleBorder(),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: SvgPicture.asset(
                collapsed
                    ? AppImages.fctsSmallLogoPng
                    : AppImages.fctsWhiteTextLogoSvg,
                height: 40,
              ),
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColors.whitef2f5fa),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  AppDrawerItem(
                    collapsed: collapsed,
                    icon: SvgPicture.asset(
                      AppImages.dashboardIconSvg,
                      width: 20,
                      height: 20,
                      color: AppColors.grey,
                    ),

                    /* Dashboard ::::::::::::::: */
                    label: const Text('Dashboard'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - CRM'),
                        onTap: () => context.goNamed(RoutesName.crm),
                      ),
                    ],
                  ),

                  /* SingleCompany ::::::::::::::: */
                  AppDrawerItem(
                    collapsed: collapsed,
                    icon: const Icon(Icons.business),
                    label: const Text('SingleCompany'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - List'),
                        onTap: () => context.goNamed(RoutesName.companyListing),
                      ),
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Create'),
                        onTap: () =>
                            context.goNamed(RoutesName.createNewCompany),
                      ),
                    ],
                  ),

                  /* Tables ::::::::::::::: */
                  AppDrawerItem(
                    collapsed: collapsed,
                    icon: const Icon(
                      Icons.table_chart_outlined,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    label: const Text('Tables'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Listing'),
                        onTap: () => context.goNamed(RoutesName.listing),
                      ),
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Category'),
                        onTap: () => context.goNamed(RoutesName.category),
                      ),
                    ],
                  ),

                  /* Forms ::::::::::::::: */
                  AppDrawerItem(
                    collapsed: collapsed,
                    icon: const Icon(
                      Icons.web,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    label: const Text('Forms'),
                    children: [
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Add Listing'),
                        onTap: () => context.goNamed(RoutesName.addListing),
                      ),
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Create Category'),
                        onTap: () => context.goNamed(RoutesName.createCategory),
                      ),
                    ],
                  ),

                  /* Pages ::::::::::::::: */
                  AppDrawerItem(
                    collapsed: collapsed,
                    icon: SvgPicture.asset(
                      AppImages.pagesIconSvg,
                      width: 20,
                      height: 20,
                      color: AppColors.grey,
                    ),
                    label: const Text('Pages'),
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
                      ListTile(
                        leading: const SizedBox(),
                        title: const Text(' - Upload Image'),
                        onTap: () => context.goNamed(RoutesName.uploadImage),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
