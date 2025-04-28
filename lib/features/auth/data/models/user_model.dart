import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.mobileNo,
    required super.phoneNo,
    required super.whatsapp,
    required super.facebook,
    required super.location,
    required super.address,
    required super.userAvatar,
    required super.accessToken,
    required super.isSeller,
    required super.isAdmin,
    required super.isUser,
    required super.isProvider,
    required super.isActive,
    required super.isPaymentDone,
    required super.isBundleExpired,
    required super.isUserOk,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      email: json['email'] ?? '',
      mobileNo: json['mobileno'] ?? '',
      phoneNo: json['phoneno'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      facebook: json['facebook'] ?? '',
      location: json['locationn'] ?? '',
      address: json['adress'] ?? '',
      userAvatar: json['user_avater'] ?? '',
      accessToken: json['accessToken'] ?? '',
      isSeller: json['is_seller'] ?? false,
      isAdmin: json['is_admin'] ?? false,
      isUser: json['is_user'] ?? false,
      isProvider: json['is_provider'] ?? false,
      isActive: json['is_active'] ?? false,
      isPaymentDone: json['ispaymentdone'] ?? false,
      isBundleExpired: json['isbundleExpired'] ?? false,
      isUserOk: json['isUserOk'] ?? false,
    );
  }
}
