import 'package:flutter_admin/base/base_bloc.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_admin/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends BaseBloc<ThemeEvent, ThemeState> {
  ThemeBloc({bool isLightThemeActive = true})
      : super(DefaultTheme(isLightThemeActive: isLightThemeActive)) {
    on<ToogleTheme>(_changeTheme);
  }

  void _changeTheme(ToogleTheme event, Emitter<ThemeState> emit) {
    final bool isLightThemeActive = (state as DefaultTheme).isLightThemeActive;
    prefUtils.setBoolIn(SharedPrefKeys.theme, !isLightThemeActive);
    emit(DefaultTheme(isLightThemeActive: !isLightThemeActive));
  }
}
