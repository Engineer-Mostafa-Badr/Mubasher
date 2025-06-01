import 'package:mubasher_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/constants/api_constants.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:io';

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
    required String url,
  }) async {
    try {
      final user = await remoteDataSource.login(
        username: username,
        password: password,
        url: url,
      );

      await secureStorage.write(key: accessTokenKey, value: user.accessToken);
      return Right(user);
    } on DioException catch (dioError) {
      return Left('Dio error: ${dioError.message}');
    } catch (e) {
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
    required bool isSeller,
    required bool isUser,
    String? facebook,
    String? documents,
    String? country,
    String? city,
    File? profileImage,
  }) async {
    try {
      final url =
          isSeller ? ApiConstants.registerSeller : ApiConstants.registerUser;
      final user = await remoteDataSource.register(
        url: url,
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        whatsapp: whatsapp,
        isSeller: isSeller,
        facebook: facebook,
        documents: documents,
        country: country,
        city: city,
        profileImage: profileImage,
      );

      if (user.accessToken.isEmpty) {
        log('🚨 User is null or accessToken is missing');
        return Left('Registration failed: Invalid user data received');
      }
      final token = _extractToken(user.accessToken);
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

  String _extractToken(String rawToken) {
    final match = RegExp(r'token\s*=\s*(.*)').firstMatch(rawToken);
    return match != null ? match.group(1)!.trim() : rawToken.trim();
  }

  @override
  Future<Either<String, String>> activateAccount({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
    required String otp,
  }) async {
    try {
      final message = await remoteDataSource.activateAccount(
        email: email,
        whatsapp: whatsapp,
        phone: phone,
        methodResponse: methodResponse,
        otp: otp,
      );
      return Right(message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<String> resendOtp({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
  }) async {
    try {
      final message = await remoteDataSource.resendOtp(
        email: email,
        whatsapp: whatsapp,
        phone: phone,
        methodResponse: methodResponse,
      );
      return message;
    } catch (e) {
      throw Exception("Resend OTP failed: ${e.toString()}");
    }
  }
}
