import 'package:mubasher_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mubasher_app/features/home/domain/repositories/home_repository.dart';
import 'package:mubasher_app/features/home/domain/entities/home_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<HomeEntity>> getHomeData() async {
    return await remoteDataSource.fetchHomeData();
  }
}
