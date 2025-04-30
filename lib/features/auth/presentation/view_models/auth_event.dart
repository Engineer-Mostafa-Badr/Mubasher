import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String whatsapp;

  const RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.whatsapp,
  });
  @override
  List<Object?> get props => [
    username,
    email,
    password,
    confirmPassword,
    phone,
    whatsapp,
  ];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}
