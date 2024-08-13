import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';

class SharedToolbarItems extends StatelessWidget {
  const SharedToolbarItems({super.key});

  @override
  Widget build(BuildContext context) {
    // icon button style
    final ButtonStyle iconButtonStyle = ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.whitef2f5fa;
        }
        return AppColors.white;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.blue0080ff;
        }
        return AppColors.grey;
      }),
      iconColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.blue0080ff;
        }
        return AppColors.grey;
      }),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          style: iconButtonStyle,
          icon: const Icon(Icons.settings),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: iconButtonStyle,
          icon: const Icon(Icons.notifications),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: iconButtonStyle,
          icon: const Icon(Icons.flag),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: iconButtonStyle,
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
