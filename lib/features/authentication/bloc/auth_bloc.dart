import 'dart:convert';

import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;

  AuthBloc({
    required AuthState authState,
    required this.authProvider,
  }) : super(authState) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }

  void _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    /* here validate email and password */
    try {
      final User user = await authProvider.login(
        email: event.email,
        password: event.password,
      );
      final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();

      sharedPreferences.setString('accessToken', user.token);
      sharedPreferences.setString('currentUser', json.encode(user.toJson()));

      emit(AuthAuthenticated(user: user));
    } on InvalidCredential {
      emit(const AuthAuthenticationFailed(error: 'Invalid email and password'));
    } catch (e) {
      print("Login Failure ::::::::::::::::::::::::::::::::::::::::::");
      print(e);
      emit(AuthAuthenticationFailed(error: e.toString()));
    }
  }

  void _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading(user: (state as AuthAuthenticated).user));
    try {
      bool isLogout = await authProvider.logout();
      if (isLogout) {
        final SharedPreferences sharedPreferences =
            GetIt.I<SharedPreferences>();

        sharedPreferences.remove('accessToken');
        sharedPreferences.remove('currentUser');
        emit(const AuthUnauthenticated(isLogout: true));
      } else {
        emit(AuthLogoutFailure(user: (state as AuthLoading).user!));
      }
    } catch (e) {
      print("Logout Failure ::::::::::::::::::::::::::::::::::::::::::");
      print(e);
      emit(AuthLogoutFailure(user: (state as AuthLoading).user!));
    }
  }
}
