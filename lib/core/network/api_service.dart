import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  factory ApiService.create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    return ApiService(dio);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      throw Exception("Error sending request: $e");
    }
  }
}
