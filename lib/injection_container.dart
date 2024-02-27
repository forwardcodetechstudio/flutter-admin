import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:get_it/get_it.dart';

void initializeDependencies() {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  GetIt.instance.registerSingleton<NetworkClient>(NetworkClient());
}