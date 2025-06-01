import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required super.phoneno,
    required super.whatsapp,
    required super.mobileNo,
    required super.facebook,
    required super.location,
    required super.address,
    required super.avatar,
    required super.isActive,
    required super.isSeller,
    required super.isAdmin,
    required super.isUser,
    required super.userType,
    required super.accessToken,
    required super.countryId,
    required super.regionId,
    required super.cityId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final accessTokenField = json['accessToken'];
    final token =
        accessTokenField is Map
            ? accessTokenField['token']?.toString() ?? ''
            : accessTokenField?.toString() ?? '';

    return UserModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword:
          json.containsKey('confirm_Password')
              ? json['confirm_Password']?.toString() ?? ''
              : '',
      phoneno: json['phoneno'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      mobileNo: json['mobileno'] ?? '',
      facebook: json['facebook'] ?? '',
      location: json['locationn'] ?? '',
      address: json['adress'] ?? '',
      avatar: json['user_avater'] ?? '',
      isActive: json['is_active'] ?? true,
      isSeller: json['is_seller'] ?? false,
      isAdmin: json['is_admin'] ?? false,
      isUser: json['is_user'] ?? false,
      userType: json['user_type'] ?? 0,
      accessToken: token,
      countryId: json['country_id'] ?? 0,
      regionId: json['region_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'email': email,
      'password': password,
      'confirm_Password': confirmPassword,
      'phoneno': phoneno,
      'whatsapp': whatsapp,
      'mobileno': mobileNo,
      'facebook': facebook,
      'locationn': location,
      'adress': address,
      'user_avater': avatar,
      'is_active': isActive,
      'is_seller': isSeller,
      'is_admin': isAdmin,
      'is_user': isUser,
      'user_type': userType,
      'accessToken': accessToken,
      'country_id': countryId,
      'region_id': regionId,
      'city_id': cityId,
    };
  }
}
