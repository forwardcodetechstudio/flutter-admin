import 'package:flutter/material.dart';
import 'package:flutter_admin/app/view/app.dart';
import 'package:flutter_admin/bootstrap.dart';
import 'package:flutter_admin/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  bootstrap(() => const App());
}
