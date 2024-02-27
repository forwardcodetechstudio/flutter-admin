import 'package:flutter_admin/core/exceptions/auth_exceptions.dart';
import 'package:flutter_admin/features/authentication/data/providers/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_admin/features/authentication/data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }

  void _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    /* here validate email and password */
    try {
      final User user = await authProvider.login(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(user: user));
    } on InvalidCredential {
      emit(const AuthAuthenticationFailed(error: 'Invalid email and password'));
    } catch (e) {
      emit(AuthAuthenticationFailed(error: e.toString()));
    }
  }

  void _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
  }
}
