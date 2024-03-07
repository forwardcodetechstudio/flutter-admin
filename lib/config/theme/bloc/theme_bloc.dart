import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({bool isLightThemeActive = true})
      : super(DefaultTheme(isLightThemeActive: isLightThemeActive)) {
    on<ToogleTheme>(_changeTheme);
  }

  void _changeTheme(ToogleTheme event, Emitter<ThemeState> emit) {
    final bool isLightThemeActive = (state as DefaultTheme).isLightThemeActive;
    final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();

    sharedPreferences.setBool('theme', !isLightThemeActive);
    emit(DefaultTheme(isLightThemeActive: !isLightThemeActive));
  }
}
