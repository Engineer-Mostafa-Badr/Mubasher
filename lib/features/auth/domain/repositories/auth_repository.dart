import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login({
    required String username,
    required String password,
  });

  Future<Either<String, UserEntity>> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
    String? facebook,
    String? documents,
    String? country,
    String? city,
    File? profileImage,
  });
  Future<Either<String, String>> activateAccount({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
    required String otp,
  });
  Future<String> resendOtp({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
  });
}
