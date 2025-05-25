import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorageHelper {
  static const _key = 'lang_code';

  static Future<void> saveLang(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, langCode);
  }

  static Future<String?> getLang() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }
}
