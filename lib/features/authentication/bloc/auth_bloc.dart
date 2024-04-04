import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_admin/base/base_bloc.dart';
import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';

import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/model/user.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({
    required this.authService,
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
      final User user = await authService.login(
        email: event.email,
        password: event.password,
      );

      prefUtils.setStringIn(SharedPrefKeys.token, user.token!);
      prefUtils.setLoggedUserValue(user);

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
      bool isLogout = await authService.logout();
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
      prefUtils.clearPreferencesData();
    }
  }

  FutureOr<void> _init(AuthInititalEvent event, Emitter<AuthState> emit) async {
    final User? user = await prefUtils.getLoggedUser();
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  void _register(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final isUserCreated = await authService.register(
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

  @override
  void onChange(Change<AuthState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
