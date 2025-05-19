import 'package:equatable/equatable.dart';
import 'dart:io';

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
  final String? facebook;
  final String? documents;
  final String? country;
  final String? city;
  final File? profileImage;
  final bool isSeller;
  final bool isUser;

  const RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.whatsapp,
    required this.isSeller,
    required this.isUser,
    this.facebook,
    this.documents,
    this.country,
    this.city,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
    username,
    email,
    password,
    confirmPassword,
    phone,
    whatsapp,
    facebook,
    documents,
    country,
    city,
    profileImage,
    isSeller,
    isUser,
  ];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class ActivateAccountEvent extends AuthEvent {
  final String email;
  final String whatsapp;
  final String phone;
  final String methodResponse;
  final String otp;

  const ActivateAccountEvent({
    required this.email,
    required this.whatsapp,
    required this.phone,
    required this.methodResponse,
    required this.otp,
  });

  @override
  List<Object?> get props => [email, whatsapp, phone, methodResponse, otp];
}

class ResendOtpEvent extends AuthEvent {
  final String email;
  final String whatsapp;
  final String phone;
  final String methodResponse;

  const ResendOtpEvent({
    required this.email,
    required this.whatsapp,
    required this.phone,
    required this.methodResponse,
  });
}
