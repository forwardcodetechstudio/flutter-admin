import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/widgets/shared_toolbar_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppbar({super.key});

  @override
  State<MobileAppbar> createState() => _MobileAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileAppbarState extends State<MobileAppbar> {
  late bool isSecondToolbarVisible;

  @override
  void initState() {
    super.initState();
    isSecondToolbarVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBar(
          titleSpacing: 24,
          title: Image.asset(
            AppImages.fctsLogo,
            height: 40,
          ),
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSecondToolbarVisible = !isSecondToolbarVisible;
                });
              },
              style: AppButtonStyles.primaryIcon,
              icon: SvgPicture.asset(
                isSecondToolbarVisible ? AppImages.horizontal : AppImages.verticle,
                width: 20,
                height: 20,
                color: AppColors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              style: AppButtonStyles.primaryIcon,
              icon: SvgPicture.asset(
                AppImages.collapse,
                width: 20,
                height: 20,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
        if (isSecondToolbarVisible)
          Positioned(
            top: kToolbarHeight,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              color: AppColors.white,
              alignment: Alignment.centerRight,
              child: const SharedToolbarItems(),
            ),
          )
      ],
    );
  }
}
