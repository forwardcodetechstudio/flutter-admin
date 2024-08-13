import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.background,
      title: Text(
        '© 2020 Orbiter - All Rights Reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
