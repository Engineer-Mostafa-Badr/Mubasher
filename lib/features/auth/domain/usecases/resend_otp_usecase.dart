import 'package:dartz/dartz.dart';
import '../repositories/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository repository;

  ResendOtpUseCase(this.repository);

  Future<Either<String, String>> call({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
  }) async {
    try {
      final result = await repository.resendOtp(
        email: email,
        whatsapp: whatsapp,
        phone: phone,
        methodResponse: methodResponse,
      );
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
