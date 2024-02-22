import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtile;
  final Widget icon;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtile,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      tileColor: AppColors.white,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
          height: 0,
        ),
      ),
      subtitle: Text(
        subtile,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      leading: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.backgroundf2f5fa,
          borderRadius: BorderRadius.circular(6),
        ),
        child: icon,
      ),
    );
  }
}
