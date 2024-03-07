part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  final User? user;

  const AuthLoading({this.user});
}

final class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({
    required this.user,
  });
}

final class AuthUnauthenticated extends AuthState {
  final bool isLogout;

  const AuthUnauthenticated({this.isLogout = false});
}

final class AuthLogoutFailure extends AuthState {
  final User? user;

  const AuthLogoutFailure({this.user});
}

final class AuthAuthenticationFailed extends AuthState {
  final String error;

  const AuthAuthenticationFailed({required this.error});
}
