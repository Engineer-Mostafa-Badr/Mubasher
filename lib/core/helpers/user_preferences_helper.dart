// ignore_for_file: avoid_print
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferencesHelper {
  static const String _userKey = 'user_data';

  static Future<void> saveUserJson(Map<String, dynamic> userJson) async {
    final prefs = await SharedPreferences.getInstance();
    print('📝 Saving user: $userJson');
    await prefs.setString(_userKey, json.encode(userJson));
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);
    print('📦 Loaded user from prefs: $userString');
    if (userString != null) {
      return jsonDecode(userString) as Map<String, dynamic>;
    }
    return null;
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
