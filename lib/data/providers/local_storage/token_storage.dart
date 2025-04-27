// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class TokenStorage {
//   // Create storage
//   final _storage = const FlutterSecureStorage();

//   // Keys for the tokens (you can customize them)
//   static const _accessTokenKey = 'ACCESS_TOKEN';
//   static const _refreshTokenKey = 'REFRESH_TOKEN';

//   // Save access token
//   Future<void> saveAuthTokenToStorage(String token) async {
//     try {
//       await _storage.write(key: _accessTokenKey, value: token);
//     } catch (e) {
//       throw Exception('Error saving access token: $e');
//     }
//   }

//   // Save refresh token
//   Future<void> saveRefreshTokenToStorage(String refreshToken) async {
//     try {
//       await _storage.write(key: _refreshTokenKey, value: refreshToken);
//     } catch (e) {
//       throw Exception('Error saving refresh token: $e');
//     }
//   }

//   // Retrieve access token
//   Future<String?> getAuthTokenFromStorage() async {
//     try {
//       return await _storage.read(key: _accessTokenKey);
//     } catch (e) {
//       throw Exception('Error retrieving access token: $e');
//     }
//   }

//   // Retrieve refresh token
//   Future<String?> getRefreshTokenFromStorage() async {
//     try {
//       return await _storage.read(key: _refreshTokenKey);
//     } catch (e) {
//       throw Exception('Error retrieving refresh token: $e');
//     }
//   }

//   // Delete tokens from storage (logout functionality)
//   Future<void> clearTokens() async {
//     try {
//       await _storage.delete(key: _accessTokenKey);
//       await _storage.delete(key: _refreshTokenKey);
//     } catch (e) {
//       throw Exception('Error clearing tokens: $e');
//     }
//   }
// }
