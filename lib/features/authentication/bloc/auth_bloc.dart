import 'dart:async';
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
    required this.authProvider,
  }) : super(const AuthUnauthenticated()) {
    on<AuthInititalEvent>(_init);
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
    on<AuthRegisterEvent>(_register);
  }

  void authStateListener() {}

  void _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    /* here validate email and password */
    try {
      final User user = await authProvider.login(
        email: event.email,
        password: event.password,
      );
      final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();

      sharedPreferences.setString('accessToken', user.token!);
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
      // if (isLogout) {
      // } else {
      //   emit(AuthLogoutFailure(user: (state as AuthLoading).user!));
      // }
    } catch (e) {
      print("Logout Failure ::::::::::::::::::::::::::::::::::::::::::");
      print(e);
      emit(AuthLogoutFailure(user: (state as AuthLoading).user!));
    } finally {
      emit(const AuthUnauthenticated(isLogout: true));
      final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();
      sharedPreferences.remove('accessToken');
      sharedPreferences.remove('currentUser');
    }
  }

  FutureOr<void> _init(AuthInititalEvent event, Emitter<AuthState> emit) {
    final SharedPreferences sharedPreferences = GetIt.I<SharedPreferences>();
    final String? userJson = sharedPreferences.getString('currentUser');
    if (userJson != null) {
      final User currentUser = User.fromJson(json.decode(userJson));
      emit(AuthAuthenticated(user: currentUser));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  void _register(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final isUserCreated = await authProvider.register(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      );

      if (isUserCreated) {
        emit(const AuthRegistrationSuccessfull(
            message:
                'Signup successful. Please check your email to confirm your account.'));
      } else {
        emit(const AuthRegistrationFailed(message: 'User does not created'));
      }
    } catch (e) {
      emit(const AuthRegistrationFailed(
          message: 'Somthing went wrong! check your connection'));
    }
  }
}
