import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initializeDependencies() async {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  GetIt.instance.registerSingleton<NetworkClient>(NetworkClient());
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton<SharedPreferences>(sharedPreferences);
}
