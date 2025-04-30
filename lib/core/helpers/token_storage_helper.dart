// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageHelper {
  static final _storage = FlutterSecureStorage();
  static const _tokenKey = 'accessToken';

  // حفظ التوكن بعد التأكد أنه String
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    print('🔐 Token saved: $token'); // إضافة سجل لتوثيق عملية الحفظ
  }

  // قراءة التوكن
  static Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);
    print('🔐 Token retrieved: $token'); // إضافة سجل لتوثيق عملية الاسترجاع
    return token;
  }

  // مسح التوكن
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    print('🔐 Token cleared');
  }
}
