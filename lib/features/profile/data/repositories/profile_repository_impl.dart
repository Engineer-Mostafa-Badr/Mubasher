import 'package:mubasher_app/core/error/failure_type.dart';
import 'package:mubasher_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:mubasher_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:mubasher_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await remoteDataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      final data = response.data;
      if (data == null || !data.containsKey('code')) {
        return Left(ServerFailure(FailureType.invalidResponse));
      }

      final code = data['code'];
      final message = data['message'] ?? FailureType.unexpectedError;

      if (code == 200 && data['isSuccess'] == true) {
        return Right(unit);
      } else if (code == 400 && message == "Current password is incorrect") {
        return Left(ServerFailure(FailureType.invalidOldPassword));
      } else {
        return Left(ServerFailure(FailureType.unexpectedError));
      }
    } on DioException catch (_) {
      return Left(ServerFailure(FailureType.serverConnectionError));
    } catch (_) {
      return Left(ServerFailure(FailureType.unexpectedError));
    }
  }
}
