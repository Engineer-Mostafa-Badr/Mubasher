import 'package:mubasher_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        username: username,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final result = await remoteDataSource.register(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
