class UserEntity {
  final int id;
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneno;
  final String whatsapp;
  final String mobileNo;
  final String facebook;
  final String location;
  final String address;
  final String avatar;
  final bool isActive;
  final bool isSeller;
  final bool isAdmin;
  final bool isUser;
  final int userType;
  final String accessToken;
  final int countryId;
  final int regionId;
  final int cityId;

  const UserEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneno,
    required this.whatsapp,
    required this.mobileNo,
    required this.facebook,
    required this.location,
    required this.address,
    required this.avatar,
    required this.isActive,
    required this.isSeller,
    required this.isAdmin,
    required this.isUser,
    required this.userType,
    required this.accessToken,
    required this.countryId,
    required this.regionId,
    required this.cityId,
  });
}
