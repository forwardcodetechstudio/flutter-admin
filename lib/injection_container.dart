import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
}