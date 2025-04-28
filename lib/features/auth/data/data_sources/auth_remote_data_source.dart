import 'package:mubasher_app/core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        ApiConstants.login,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['datac'][0]);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await apiService.post(
        ApiConstants.register,
        data: {
          'userName': username,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['datac'][0]);
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
