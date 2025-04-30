import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.mobileNo,
    required super.whatsapp,
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
    required super.phoneno,
    required super.password,
    required super.confirmPassword,
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
      confirmPassword: json['confirm_password'] ?? '',
      phoneno: json['phoneno'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      mobileNo: json['mobileno'] ?? '',
      facebook: json['facebook'] ?? '',
      location: json['locationn'] ?? '',
      address: json['adress'] ?? '',
      avatar: json['user_avater'] ?? '',
      isActive: json['is_active'] ?? false,
      isSeller: json['is_seller'] ?? false,
      isAdmin: json['is_admin'] ?? false,
      isUser: json['is_user'] ?? true,
      userType: json['user_type'] ?? 0,
      accessToken: token,
    );
  }
}
