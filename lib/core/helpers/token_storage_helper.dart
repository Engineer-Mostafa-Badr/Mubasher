// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageHelper {
  static final _storage = FlutterSecureStorage();
  static const _tokenKey = 'accessToken';
  static Future<void> saveToken(String token) async {
    final cleanToken = _extractJwtFromRaw(token);
    await _storage.write(key: _tokenKey, value: cleanToken);
    print('🔐 Token saved: $cleanToken');
  }

  static String _extractJwtFromRaw(String? rawToken) {
    if (rawToken == null) return '';
    if (rawToken.contains('token =')) {
      final tokenMatch = RegExp(r'token\s*=\s*(\S+)').firstMatch(rawToken);
      return tokenMatch?.group(1) ?? '';
    }
    return rawToken;
  }

  static Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);
    print('🔐 Token retrieved: $token');
    return token;
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    print('🔐 Token cleared');
  }
}
