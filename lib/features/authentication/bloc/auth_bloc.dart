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
  }

  void _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    /* here validate email and password */
    final User? user =
        await authProvider.login(email: event.email, password: event.password);

    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(const AuthAuthenticationFailed(error: 'Invalid email and password'));
    }
  }
}
