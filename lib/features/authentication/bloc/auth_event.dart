part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInititalEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthRegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const AuthRegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

class AuthLogoutEvent extends AuthEvent {}
