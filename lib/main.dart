import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_admin/features/authentication/data/providers/anbocas_auth_provider.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_admin/features/company/repositories/companies_repository.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';
import 'package:flutter_admin/core/shared/repositories/remote_categories.dart';
import 'package:flutter_admin/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authProvider: AnbocasAuthProvider(
              client: GetIt.I<NetworkClient>().client,
            ),
          ),
        ),
        BlocProvider(create: (context) => ListingBloc()),
        BlocProvider(
          create: (context) => CompaniesBloc(
            companiesRepository: CompaniesRepository(
              client: GetIt.I<NetworkClient>().client,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            RemoteCategory(
              client: GetIt.I<NetworkClient>().client,
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
        ),
        routerConfig: GetIt.I<AppRouter>().router,
      ),
    );
  }
}
