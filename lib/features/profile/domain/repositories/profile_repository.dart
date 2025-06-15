import 'package:mubasher_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, void>> updateUserProfile(Map<String, dynamic> data);
}
