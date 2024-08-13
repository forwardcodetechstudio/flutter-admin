import 'package:flutter_admin/core/utils/logger_utils.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState)
      : loggerUtils = GetIt.instance<LoggerUtils>(),
        prefUtils = GetIt.instance<PrefUtils>();

  final LoggerUtils loggerUtils;
  final PrefUtils prefUtils;
}
