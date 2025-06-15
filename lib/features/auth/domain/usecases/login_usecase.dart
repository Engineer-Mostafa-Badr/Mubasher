import 'dart:convert';

import 'package:mubasher_app/core/constants/api_constants.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:developer';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String username,
    required String password,
    required bool isSeller,
  }) async {
    final url = isSeller ? ApiConstants.loginSeller : ApiConstants.loginUser;
    log('🔥 Login response JSON: $jsonEncode');
    return repository.login(username: username, password: password, url: url);
  }
}
