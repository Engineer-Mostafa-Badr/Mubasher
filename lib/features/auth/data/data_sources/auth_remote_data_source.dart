import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/user_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AuthRemoteDataSourceImpl(this.apiService, this.secureStorage);

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        ApiConstants.login,
        data: {'Username': username, 'Password': password},
      );

      if (response.statusCode == 200 &&
          response.data is Map &&
          response.data['datac'] is List &&
          (response.data['datac'] as List).isNotEmpty) {
        log('Login successful: ${response.data}');
        return UserModel.fromJson(response.data['datac'][0]);
      } else {
        throw Exception('Login failed - Unexpected response: ${response.data}');
      }
    } catch (e) {
      throw Exception('Login exception: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
  }) async {
    try {
      final response = await apiService.post(
        ApiConstants.register,
        data: {
          'user_name': username,
          'email': email,
          'phoneno': phone,
          'mobileno': phone,
          'password': password,
          'confirm_Password': password,
          'whatsapp': whatsapp,
          'is_active': true,
          'is_seller': isSeller,
          'is_admin': false,
          'is_user': !isSeller,
          'locationn': '',
          'user_type': isSeller ? 2 : 1,
          'adress': '',
          'facebook': '',
          'user_avater': '',
          'country_id': 1,
          'region_id': 1,
          'city_id': 1,
        },
      );

      if (response.statusCode == 200 &&
          response.data is Map &&
          response.data['datac'] is List &&
          (response.data['datac'] as List).isNotEmpty) {
        log('Register successful: ${response.data}');
        final accessTokenField = response.data['datac'][0]['accessToken'];
        final token =
            accessTokenField is Map
                ? accessTokenField['token'] ?? ''
                : accessTokenField.toString();

        await secureStorage.write(key: 'accessToken', value: token);
        log('Token saved: $token');

        return UserModel.fromJson(response.data['datac'][0]);
      } else {
        throw Exception(
          'Register failed - Unexpected response: ${response.data}',
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 400 &&
          dioError.response?.data != null) {
        final errorData = dioError.response!.data;
        final errors = errorData['errors'] ?? {};
        final messages = (errors as Map).entries
            .map((e) => '${e.key}: ${(e.value as List).join(', ')}')
            .join('\n');
        throw Exception('Registration failed:\n$messages');
      }
      throw Exception('Dio error: ${dioError.message}');
    } catch (e) {
      throw Exception('Register exception: ${e.toString()}');
    }
  }
}
