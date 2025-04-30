import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'dart:developer';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      log('📩 LoginEvent received');
      emit(AuthLoading());
      log('🔄 Emitting AuthLoading for Login');

      final result = await loginUseCase(
        username: event.username,
        password: event.password,
      );

      if (result.isLeft()) {
        final error = result.fold((l) => l, (r) => null);
        log('❌ Login failed: $error');
        if (!emit.isDone) emit(AuthError(error ?? 'Unknown error'));
      } else {
        final user = result.fold((l) => null, (r) => r);
        if (user != null) {
          log('✅ Login success: ${user.email}');
          await TokenStorageHelper.saveToken(user.accessToken);
          log('🔐 Token saved: ${user.accessToken}');
          if (!emit.isDone) emit(AuthLoaded(user));
        }
      }
    });

    on<RegisterEvent>((event, emit) async {
      log('📩 RegisterEvent received');
      emit(AuthLoading());
      log('🔄 Emitting AuthLoading for Register');

      final result = await registerUseCase(
        username: event.username,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        phone: event.phone,
        whatsapp: event.whatsapp,
      );

      if (result.isLeft()) {
        final error = result.fold((l) => l, (r) => null);
        log('❌ Register failed: $error');
        if (!emit.isDone) emit(AuthError(error ?? 'Unknown error'));
      } else {
        final user = result.fold((l) => null, (r) => r);
        if (user != null) {
          log('✅ Register success: ${user.email}');
          await TokenStorageHelper.saveToken(user.accessToken);
          log('🔐 Token saved: ${user.accessToken}');
          if (!emit.isDone) emit(AuthLoaded(user));
        }
      }
    });
    on<LogoutEvent>((event, emit) async {
      log('📤 LogoutEvent received');
      emit(AuthLoading()); // لو حابب تظهر loading أثناء الـ logout
      // مسح التوكن من الـ Secure Storage
      await TokenStorageHelper.clearToken();
      log('🧹 Token cleared');
      // إرسال حالة AuthLoggedOut بعد المسح
      emit(AuthLoggedOutSuccess());
    });
  }
}
