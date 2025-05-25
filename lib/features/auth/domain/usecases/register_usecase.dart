import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
    required bool isUser,
    String? facebook,
    String? documents,
    String? country,
    String? city,
    File? profileImage,
  }) {
    return repository.register(
      username: username,
      email: email,
      password: password,
      confirmPassword: password,
      phone: phone,
      whatsapp: whatsapp,
      isSeller: isSeller,
      isUser: isUser,
      facebook: facebook,
      documents: documents,
      country: country,
      city: city,
      profileImage: profileImage,
    );
  }
}
