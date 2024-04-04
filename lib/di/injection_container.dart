import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/utils/logger_utils.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';
import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:flutter_admin/services/interfaces/companies_repository.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

AuthBloc get authBloc => getIt.get<AuthBloc>();
AppRouter get appRouter => getIt.get<AppRouter>();
PrefUtils get prefUtils => getIt.get<PrefUtils>();
NetworkClient get networkClient => getIt.get<NetworkClient>();
ThemeBloc get themeBloc => getIt.get<ThemeBloc>();
ListingBloc get listingBloc => getIt.get<ListingBloc>();

Future<void> initializeDependencies() async {
  getIt.registerSingleton<LoggerUtils>(LoggerUtils());
  await setupTheAsyncService();
  registerServices();
  registerBlocs();
}

void registerBlocs() {
  getIt.registerSingleton<AuthBloc>(AuthBloc(
    authService: AuthService(networkClient.client),
  ));
  getIt.registerSingleton<ThemeBloc>(
      ThemeBloc(isLightThemeActive: prefUtils.getBoolIn(SharedPrefKeys.theme)));
  getIt.registerSingleton<ListingBloc>(ListingBloc());
  getIt.registerSingleton<CategoryBloc>(CategoryBloc(RemoteCategoryService(
    networkClient.client,
  )));
  getIt.registerSingleton<CompaniesBloc>(CompaniesBloc(
      companiesRepository: CompaniesRepository(
    networkClient.client,
  )));
}

void registerServices() {
  getIt.registerSingleton<NetworkClient>(NetworkClient());
  getIt.registerSingleton<AppRouter>(AppRouter());
}

Future<void> setupTheAsyncService() async {
  getIt.registerSingleton<PrefUtils>(PrefUtils());
  await prefUtils.init();
}
