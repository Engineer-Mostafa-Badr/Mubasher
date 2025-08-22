class HomeEntity {
  final int id;
  final String titleAr;
  final String titleEn;
  final String descAr;
  final String descEn;
  final String photoUrl;
  final String homeUrl;
  final bool isActive;

  HomeEntity({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.descAr,
    required this.descEn,
    required this.photoUrl,
    required this.homeUrl,
    required this.isActive,
  });
}
