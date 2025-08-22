import 'package:mubasher_app/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.id,
    required super.titleAr,
    required super.titleEn,
    required super.descAr,
    required super.descEn,
    required super.photoUrl,
    required super.homeUrl,
    required super.isActive,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      descAr: json['desc_ar'] ?? '',
      descEn: json['desc_en'] ?? '',
      photoUrl: json['photoURL'] ?? '',
      homeUrl: json['homeURL'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }
}
