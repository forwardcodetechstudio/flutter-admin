import 'package:flutter/material.dart';
import 'package:flutter_admin/core/utils/serializer_methods.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const LightTheme());

  void changeTheme(ThemeMode themeMode) {
    // if (themeMode case ThemeMode.system) {
    //   emit(const SystemTheme());
    // } else
    if (themeMode case ThemeMode.light) {
      emit(const LightTheme());
    } else if (themeMode case ThemeMode.dark) {
      emit(const DarkTheme());
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return state.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
