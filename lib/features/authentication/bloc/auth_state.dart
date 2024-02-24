part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final User user;
  final bool isAuthenticated;

  const AuthAuthenticated({
    required this.user,
    required this.isAuthenticated,
  });
}

final class AuthLogout extends AuthState {}
