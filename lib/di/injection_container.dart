import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/utils/logger_utils.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/network/api_service_impl.dart';
import 'package:flutter_admin/network/dio_api_client.dart';
import 'package:flutter_admin/services/impl/auth_service_impl.dart';
import 'package:flutter_admin/services/impl/companies_repository_impl.dart';
import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:flutter_admin/services/interfaces/companies_repository.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';
import 'package:get_it/get_it.dart';
import '../services/impl/remote_categories_service_impl.dart';

final getIt = GetIt.instance;

DioApiClient get dio => getIt.get<DioApiClient>();
AppRouter get appRouter => getIt.get<AppRouter>();
PrefUtils get prefUtils => getIt.get<PrefUtils>();

Future<void> initializeDependencies() async {
  await setupTheAsyncService();
  getIt.registerSingleton<DioApiClient>(DioApiClient());
  dio.initialize();
  getIt.registerSingleton<LoggerUtils>(LoggerUtils());
  registerServices();
  registerBlocs();
}

//? ------------------------Blocs services ----------------------------

ThemeBloc get themeBloc => getIt.get<ThemeBloc>();
ListingBloc get listingBloc => getIt.get<ListingBloc>();
AuthBloc get authBloc => getIt.get<AuthBloc>();

void registerBlocs() {
  getIt.registerSingleton<AuthBloc>(AuthBloc(
    authService: authService,
  ));
  getIt.registerSingleton<ThemeBloc>(
      ThemeBloc(isLightThemeActive: prefUtils.getBoolIn(SharedPrefKeys.theme)));
  getIt.registerSingleton<ListingBloc>(ListingBloc());
  getIt.registerSingleton<CategoryBloc>(CategoryBloc(remoteCategoryService));
  getIt.registerSingleton<CompaniesBloc>(CompaniesBloc(companyRepo));
}

//? ------------------------App services ----------------------------

ApiService get apiService => getIt.get<ApiService>();
AuthService get authService => getIt.get<AuthService>();
CompaniesRepository get companyRepo => getIt.get<CompaniesRepository>();
RemoteCategoryService get remoteCategoryService =>
    getIt.get<RemoteCategoryService>();

void registerServices() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt
    ..registerSingleton<ApiService>(ApiServiceImpl(dio))
    ..registerLazySingleton<AuthService>(() => AuthServiceImpl(apiService))
    ..registerLazySingleton<RemoteCategoryService>(
        () => RemoteCategoryImpl(apiService))
    ..registerLazySingleton<CompaniesRepository>(
        () => CompaniesRepositoryImpl(apiService));
}

Future<void> setupTheAsyncService() async {
  getIt.registerSingleton<PrefUtils>(PrefUtils());
  await prefUtils.init();
}
