import 'package:get_it/get_it.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';

final di = GetIt.instance;

void initDI() {
  // Usecases
  di.registerLazySingleton(() => LoginUseCase(di()));
  di.registerLazySingleton(() => RegisterUseCase(di()));

  // Bloc
  di.registerFactory(() => AuthBloc(loginUseCase: di(), registerUseCase: di()));

  // هنا هتسجل كمان ال Repositories وال DataSources لما نجهزهم
}
