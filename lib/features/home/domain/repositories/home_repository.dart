import 'package:mubasher_app/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<List<HomeEntity>> getHomeData();
}
