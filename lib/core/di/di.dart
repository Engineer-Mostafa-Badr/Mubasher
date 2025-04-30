import 'package:mubasher_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mubasher_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mubasher_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:mubasher_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mubasher_app/core/constants/api_constants.dart';
import 'package:mubasher_app/core/network/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

final getIt = GetIt.instance;

void initDI() {
  /// Dio instance with logging interceptor
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('📤 Request [${options.method}] => URL: ${options.uri}');
          log('Headers: ${options.headers}');
          log('Body: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log(
            '✅ Response [${response.statusCode}] => URL: ${response.requestOptions.uri}',
          );
          log('Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          log(
            '❌ Error [${e.response?.statusCode}] => URL: ${e.requestOptions.uri}',
          );
          log('Message: ${e.message}');
          if (e.response != null) {
            log('Error Response: ${e.response?.data}');
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  });

  /// Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  /// API Service
  getIt.registerLazySingleton<ApiService>(
    () => ApiServiceImpl(getIt<Dio>(), ApiConstants.baseUrl),
  );

  /// Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      getIt<ApiService>(),
      getIt<FlutterSecureStorage>(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      secureStorage: getIt<FlutterSecureStorage>(),
    ),
  );

  /// Use Cases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));

  /// Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(loginUseCase: getIt(), registerUseCase: getIt()),
  );
}
