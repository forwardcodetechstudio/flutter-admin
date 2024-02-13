import 'package:flutter_admin/config/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoutesCubit extends Cubit<GoRouter> {
  RoutesCubit(): super(AppRouter().router);
}