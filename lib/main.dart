import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/injection_container.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Admin',
      routerConfig: GetIt.I<AppRouter>().router,
    );
  }
}
