import 'package:flutter/material.dart';
import 'package:flutter_admin/app/view/app.dart';
import 'package:flutter_admin/bootstrap.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_admin/di/injection_container.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDependencies();
  FlutterNativeSplash.remove();
  bootstrap(() => const App());
}
