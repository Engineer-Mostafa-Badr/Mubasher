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
  Future<Response> updateUserProfile(Map<String, dynamic> userData);
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

  @override
  Future<Response> updateUserProfile(Map<String, dynamic> userData) async {
    final token = await TokenStorageHelper.getToken();

    final headers = {
      'Content-Type': 'application/json-patch+json',
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    };

    final response = await apiService.post(
      ApiConstants.editProfileUser, // تأكد من المسار هنا
      data: userData,
      headers: headers,
    );

    final data = response.data;

    if (data == null ||
        data is! Map<String, dynamic> ||
        !(data.containsKey('datac') &&
            data['datac'] is List &&
            data['datac'].isNotEmpty)) {
      throw FormatException("Invalid response structure");
    }

    return response;
  }
}
