part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthNotAuthenticated extends AuthState {}

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

final class AuthAuthenticationFailed extends AuthState {
  final String error;

  const AuthAuthenticationFailed({required this.error});
}

final class AuthLogout extends AuthState {}
