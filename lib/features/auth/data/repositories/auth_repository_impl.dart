import 'package:mubasher_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

const String accessTokenKey = 'accessToken';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  @override
  Future<Either<String, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        username: username,
        password: password,
      );

      // تخزين التوكن بشكل آمن
      await secureStorage.write(key: accessTokenKey, value: user.accessToken);

      return Right(user);
    } on DioException catch (dioError) {
      // التعامل مع الأخطاء الخاصة بـ Dio
      return Left('Dio error: ${dioError.message}');
    } catch (e) {
      // التعامل مع الأخطاء العامة
      return Left('An error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, UserEntity>> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
  }) async {
    try {
      final result = await remoteDataSource.register(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        whatsapp: whatsapp,
      );

      final user = result;

      // استخراج التوكن
      final token = _extractToken(user.accessToken);

      // تخزين التوكن بشكل آمن
      await secureStorage.write(key: accessTokenKey, value: token);

      return Right(user);
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 400 &&
          dioError.response?.data != null) {
        final errorData = dioError.response!.data;
        final errors = errorData['errors'] ?? {};
        final messages = (errors as Map).entries
            .map((e) => '${e.key}: ${(e.value as List).join(', ')}')
            .join('\n');
        return Left('Registration failed:\n$messages');
      }
      return Left('Dio error: ${dioError.message}');
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }

  // دالة لاستخراج التوكن من الاستجابة
  String _extractToken(String rawToken) {
    final match = RegExp(r'token\s*=\s*(.*)').firstMatch(rawToken);
    return match != null ? match.group(1)!.trim() : rawToken.trim();
  }
}
