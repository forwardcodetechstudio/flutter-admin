import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/data/providers/anbocas_auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.I;

void initializeDependencies() async {
  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
  GetIt.instance.registerSingleton<NetworkClient>(NetworkClient());
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton<SharedPreferences>(sharedPreferences);
  GetIt.instance.registerSingleton<AuthBloc>(AuthBloc(
    authProvider: AnbocasAuthProvider(client: getIt<NetworkClient>().client),
  ));
}
