import 'package:mubasher_app/features/home/presentation/view_models/home_states.dart';
import 'package:mubasher_app/features/home/domain/repositories/home_repository.dart';
import 'package:mubasher_app/features/home/presentation/view_models/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final data = await repository.getHomeData();
        emit(HomeLoaded(data));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
