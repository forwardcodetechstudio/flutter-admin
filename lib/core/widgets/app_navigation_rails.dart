import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationRails extends StatelessWidget {
  const AppNavigationRails({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: true,
      leading: SvgPicture.asset(AppImages.logo),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          label: SizedBox(
            width: 200,
            child: ExpansionTile(
              title: Text('Dashboard'),
              children: [
                ListTile(
                  title: Text(' - CRM'),
                )
              ],
            ),
          ),
        ),
        NavigationRailDestination(
            icon: Icon(Icons.dashboard), label: Text('Pages')),
      ],
      selectedIndex: 0,
    );
  }
}
