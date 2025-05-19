import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  });
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;
  final String baseUrl;

  ApiServiceImpl(this._dio, this.baseUrl);

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get('$baseUrl$url', queryParameters: queryParameters);
  }

  @override
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    final String url = '$baseUrl$path';

    final defaultHeaders = {
      'Content-Type': 'application/json-patch+json',
      'accept': 'text/plain',
    };

    final mergedHeaders = {...defaultHeaders, if (headers != null) ...headers};

    return await _dio.post(
      url,
      data: data,
      options: Options(headers: mergedHeaders),
    );
  }
}
