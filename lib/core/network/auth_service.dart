// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // قراءة التوكن من التخزين الآمن
  Future<String?> getToken() async {
    try {
      String? token = await _secureStorage.read(key: 'accessToken');
      print(
        '🔐 Token retrieved: $token',
      ); // سجل للتأكد من قيمة التوكن المسترجعة
      return token;
    } catch (e) {
      print('❌ Error reading token: $e'); // سجل إذا حدث خطأ أثناء قراءة التوكن
      return null;
    }
  }

  // تحقق إذا كان التوكن موجودًا وتوجيه المستخدم إلى الصفحة المناسبة
  Future<void> checkAuthentication(BuildContext context) async {
    try {
      String? token = await getToken();

      if (token != null && token.isNotEmpty) {
        // التوكن موجود، نقوم بتوجيه المستخدم إلى الصفحة الرئيسية
        print('✅ Token is valid, navigating to home route');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, PageRouteName.homeRoute);
      } else {
        // التوكن غير موجود، نقوم بتوجيه المستخدم إلى صفحة التسجيل أو تسجيل الدخول
        print('❌ Token is invalid or missing, navigating to sign-in route');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, PageRouteName.signInRoute);
      }
    } catch (e) {
      print(
        '❌ Error during authentication check: $e',
      ); // سجل إذا حدث خطأ أثناء التحقق من التوكن
    }
  }
}
