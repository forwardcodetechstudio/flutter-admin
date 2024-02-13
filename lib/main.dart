import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RoutesCubit(),
        )
      ],
      child: BlocBuilder<RoutesCubit, GoRouter>(
        builder: (context, appRouter) {
          return MaterialApp.router(
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
