import 'package:mubasher_app/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeEntity> data;
  HomeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
