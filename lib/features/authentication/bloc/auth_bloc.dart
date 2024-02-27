import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/core/resources/app_storage.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';
import 'package:get_it/get_it.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
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
      GetIt.I<AppStorage>().setAccessToken(token: user.token);
      emit(AuthAuthenticated(user: user));
    } on InvalidCredential {
      emit(const AuthAuthenticationFailed(error: 'Invalid email and password'));
    } catch (e) {
      emit(AuthAuthenticationFailed(error: e.toString()));
    }
  }

  void _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading(user: (state as AuthAuthenticated).user));
    try {
      bool isLogout = await authProvider.logout();
      if (isLogout) {
        GetIt.I<AppStorage>().removeAccessToken();
        emit(AuthLogout());
      } else {
        emit(AuthAuthenticated(user: (state as AuthLoading).user!));
      }
    } on LogoutFailure {
      print('Logout failed');
    }
  }
}
