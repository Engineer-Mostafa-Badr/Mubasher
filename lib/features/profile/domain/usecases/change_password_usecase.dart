import 'package:mubasher_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:mubasher_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final ProfileRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, Unit>> call(ChangePasswordParams params) {
    return repository.changePassword(
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
      confirmPassword: params.confirmPassword,
    );
  }
}

class ChangePasswordParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordParams({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
