import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> post(String url, {Map<String, dynamic>? data});
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;
  final String baseUrl;

  ApiServiceImpl(this._dio, this.baseUrl);

  @override
  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await _dio.post(url, data: data);
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }
}
