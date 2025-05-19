import 'package:dartz/dartz.dart';
import 'package:mubasher_app/features/auth/domain/repositories/auth_repository.dart';

class ActivateAccountUseCase {
  final AuthRepository repository;

  ActivateAccountUseCase(this.repository);

  Future<Either<String, String>> call({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
    required String otp,
  }) {
    return repository.activateAccount(
      email: email,
      whatsapp: whatsapp,
      phone: phone,
      methodResponse: methodResponse,
      otp: otp,
    );
  }
}
