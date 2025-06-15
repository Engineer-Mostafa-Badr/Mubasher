import 'package:mubasher_app/features/auth/domain/usecases/active_user_account_usecase.dart';
import 'package:mubasher_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:mubasher_app/core/helpers/language_storage_helper.dart';
import 'package:mubasher_app/core/helpers/user_preferences_helper.dart';
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
  final ActivateAccountUseCase activateAccountUseCase;
  final AuthRepository authRepository;

  AuthBloc({
    required this.loginUseCase,
    required this.authRepository,
    required this.registerUseCase,
    required this.activateAccountUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      log('📩 LoginEvent received');
      emit(AuthLoading());
      log('🔄 Emitting AuthLoading for Login');

      final result = await loginUseCase(
        username: event.username,
        password: event.password,
        isSeller: event.isSeller,
      );

      if (result.isLeft()) {
        final error = result.fold((l) => l, (r) => null);
        log('❌ Login failed: $error');
        if (!emit.isDone) emit(AuthError(error ?? 'Unknown error'));
      } else {
        final user = result.fold((l) => null, (r) => r);
        if (user != null) {
          log('✅ Login success: ${user.email}');
          if (user.accessToken.isNotEmpty) {
            await TokenStorageHelper.saveToken(user.accessToken);
          }

          log('🔐 Token saved: ${user.accessToken}');
          await UserPreferencesHelper.saveUserJson(user.toJson());
          log('💾 User saved to SharedPreferences');
          if (!emit.isDone) emit(AuthLoaded(user: user));
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
        isSeller: event.isSeller,
        isUser: !event.isSeller,
        facebook: event.facebook,
        documents: event.documents,
        country: event.country,
        city: event.city,
        profileImage: event.profileImage,
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
          await UserPreferencesHelper.saveUserJson(user.toJson());
          log('💾 User saved to SharedPreferences');
          if (!emit.isDone) emit(AuthLoaded(user: user));
        } else {
          log('❌ Register returned null user');
          emit(AuthError("Registration failed: No user returned"));
          log('🔎 user == null ? ${user == null}');
        }
      }
    });

    on<LogoutEvent>((event, emit) async {
      log('📤 LogoutEvent received');
      emit(AuthLoggedOutLoading());

      await TokenStorageHelper.clearToken();
      log('🧹 Token cleared');

      emit(AuthLoggedOutSuccess());
    });

    on<ActivateAccountEvent>((event, emit) async {
      emit(OtpVerifying());

      final result = await activateAccountUseCase(
        email: event.email,
        whatsapp: event.whatsapp,
        phone: event.phone,
        methodResponse: event.methodResponse,
        otp: event.otp,
      );

      result.fold((error) => emit(OtpError(error)), (_) => emit(OtpVerified()));
    });

    on<ResendOtpEvent>((event, emit) async {
      try {
        await authRepository.resendOtp(
          email: event.email,
          whatsapp: event.whatsapp,
          phone: event.phone,
          methodResponse: event.methodResponse,
        );
        emit(OtpResent());
      } catch (e) {
        emit(OtpResendError(e.toString()));
      }
    });

    on<ChangeLanguageEvent>((event, emit) async {
      log('🌐 ChangeLanguageEvent received: ${event.languageCode}');
      await LanguageStorageHelper.saveLang(event.languageCode);
      emit(LanguageChangedState(event.languageCode));
    });

    on<ContinueWithoutLoginEvent>((event, emit) {
      log('👤 Guest mode activated');
      emit(AuthGuestState());
    });

    on<LoadSavedUserEvent>((event, emit) async {
      log('📂 Loading saved user into AuthBloc: ${event.user.email}');
      await TokenStorageHelper.saveToken(event.user.accessToken);
      await UserPreferencesHelper.saveUserJson(event.user.toJson());
      emit(AuthLoaded(user: event.user));
    });
  }
}
