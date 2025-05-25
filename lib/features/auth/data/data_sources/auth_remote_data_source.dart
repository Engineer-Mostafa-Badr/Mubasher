import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/user_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:io';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String username,
    required String password,
    required String url,
  });
  Future<UserModel> register({
    required String url,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
    String? facebook,
    String? documents,
    String? country,
    String? city,
    File? profileImage,
  });
  Future<String> activateAccount({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
    required String otp,
  });
  Future<String> resendOtp({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
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
    required String url,
  }) async {
    try {
      final response = await apiService.post(
        url,
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
    required String url,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String whatsapp,
    required bool isSeller,
    String? facebook,
    String? documents,
    String? country,
    String? city,
    File? profileImage,
  }) async {
    try {
      final jsonData = {
        'user_name': username,
        'email': email,
        'phoneno': phone,
        'mobileno': phone,
        'password': password,
        'confirm_Password': confirmPassword,
        'whatsapp': whatsapp,
        'is_active': true,
        'is_seller': isSeller,
        'is_admin': false,
        'is_user': !isSeller,
        'locationn': '',
        'user_type': isSeller ? 2 : 1,
        'adress': '',
        'facebook': facebook ?? '',
        'documents': documents ?? '',
        'country': country ?? '',
        'city': city ?? '',
        'country_id': 1,
        'region_id': 1,
        'city_id': 1,
        // 'user_avater': profileImage  <-- مؤقتًا لا ترسلها
      };

      final response = await apiService.post(
        url,
        data: jsonData,
        headers: {
          "Content-Type": "application/json-patch+json",
          "accept": "text/plain",
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

  @override
  Future<String> activateAccount({
    required String email,
    required String whatsapp,
    required String phone,
    required String methodResponse,
    required String otp,
  }) async {
    try {
      final data = {
        'email': email,
        'whatsapp': whatsapp,
        'phone': phone,
        'methodResponse': methodResponse,
        'otp': otp,
      };

      final response = await apiService.post(
        ApiConstants.activateUserAccount,
        data: data,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        log('✅ Account activated successfully');
        return response.data['message'] ?? "Account activated successfully";
      } else {
        throw Exception("Activation failed: ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception("Dio Error: ${e.message}");
    } catch (e) {
      throw Exception("Unknown activation error: ${e.toString()}");
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
      final data = {
        'email': email,
        'whatsapp': whatsapp,
        'phone': phone,
        'methodResponse': methodResponse,
      };

      final response = await apiService.post(
        ApiConstants.activateUserAccount,
        data: data,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        log('📩 OTP resent successfully');
        return response.data['message'] ?? "OTP resent successfully";
      } else {
        throw Exception("Resend OTP failed: ${response.data}");
      }
    } on DioException catch (e) {
      throw Exception("Dio Error (Resend OTP): ${e.message}");
    } catch (e) {
      throw Exception("Unknown resend OTP error: ${e.toString()}");
    }
  }
}
