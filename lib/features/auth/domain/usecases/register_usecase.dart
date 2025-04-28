import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return repository.register(
      username: username,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
