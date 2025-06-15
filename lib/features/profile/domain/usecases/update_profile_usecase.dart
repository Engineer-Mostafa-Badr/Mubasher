import 'package:mubasher_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:mubasher_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, void>> call(Map<String, dynamic> data) {
    return repository.updateUserProfile(data);
  }
}
