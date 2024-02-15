import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';

class SharedToolbarItems extends StatelessWidget {
  const SharedToolbarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          style: AppButtonStyles.primaryIcon,
          icon: const Icon(Icons.settings),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: AppButtonStyles.primaryIcon,
          icon: const Icon(Icons.notifications),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: AppButtonStyles.primaryIcon,
          icon: const Icon(Icons.flag),
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: () {},
          style: AppButtonStyles.primaryIcon,
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
