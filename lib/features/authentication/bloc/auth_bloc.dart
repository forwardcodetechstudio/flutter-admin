import 'dart:async';
import 'dart:developer';
import 'package:flutter_admin/base/base_bloc.dart';
import 'package:flutter_admin/core/utils/pref_utils.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/model/user.dart';
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
    final ApiResponse resp = await authService.login(
      email: event.email,
      password: event.password,
    );
    if (resp.data != null && resp.data is User) {
      prefUtils.setStringIn(SharedPrefKeys.token, resp.data.token!);
      prefUtils.setLoggedUserValue(resp.data);
      emit(AuthAuthenticated(user: resp.data));
    } else {
      emit(AuthAuthenticationFailed(error: resp.error?.errorMsg ?? ""));
    }
  }

  void _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading(user: (state as AuthAuthenticated).user));
    final ApiResponse resp = await authService.logout();
    if (resp.data != null) {
      emit(const AuthUnauthenticated(isLogout: true));
      prefUtils.clearPreferencesData();
    } else {
      emit(AuthAuthenticationFailed(error: resp.error?.errorMsg ?? ""));
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
    final ApiResponse resp = await authService.register(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      password: event.password,
    );
    if (resp.data != null) {
      emit(const AuthRegistrationSuccessfull(
          message:
              'Signup successful. Please check your email to confirm your account.'));
    } else {
      emit(AuthAuthenticationFailed(error: resp.error?.errorMsg ?? ""));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
