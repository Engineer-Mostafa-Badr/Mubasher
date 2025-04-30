import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

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
  });
}
