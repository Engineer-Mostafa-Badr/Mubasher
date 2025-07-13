// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() async {
    try {
      String? token = await _secureStorage.read(key: 'access_token');
      print('🔐 Token retrieved: $token');
      return token;
    } catch (e) {
      print('❌ Error reading token: $e');
      return null;
    }
  }

  Future<void> checkAuthentication(BuildContext context) async {
    try {
      String? token = await getToken();

      if (token != null && token.isNotEmpty) {
        print('✅ Token is valid, navigating to home route');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, PageRouteName.homeUserRoute);
      } else {
        print('❌ Token is invalid or missing, navigating to sign-in route');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, PageRouteName.signInRoute);
      }
    } catch (e) {
      print('❌ Error during authentication check: $e');
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(key: 'refresh_token');

      final response = await Dio().post(
        'path',
        data: {'refresh_token': refreshToken},
      );
      if (response.statusCode == 200) {
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await _secureStorage.write(key: 'access_token', value: newAccessToken);
        await _secureStorage.write(
          key: 'refresh_token',
          value: newRefreshToken,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
