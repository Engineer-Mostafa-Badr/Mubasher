import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import 'package:mubasher_app/core/constants/api_constants.dart';
import 'package:mubasher_app/core/network/api_service.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final token = await TokenStorageHelper.getToken();

    final headers = {
      'Content-Type': 'application/json-patch+json',
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    };

    final response = await apiService.post(
      ApiConstants.changeUserPassword,
      data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      },
      headers: headers,
    );

    return response;
  }
}
