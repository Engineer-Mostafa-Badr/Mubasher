import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase(
        username: event.username,
        password: event.password,
      );

      result.fold(
        (error) => emit(AuthError(error)),
        (user) => emit(AuthLoaded(user)),
      );
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await registerUseCase(
        username: event.username,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      result.fold(
        (error) => emit(AuthError(error)),
        (user) => emit(AuthLoaded(user)),
      );
    });
  }
}
