import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text(
        '© 2020 Orbiter - All Rights Reserved.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
