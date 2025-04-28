class UserEntity {
  final int id;
  final String userName;
  final String email;
  final String mobileNo;
  final String phoneNo;
  final String whatsapp;
  final String facebook;
  final String location;
  final String address;
  final String userAvatar;
  final String accessToken;
  final bool isSeller;
  final bool isAdmin;
  final bool isUser;
  final bool isProvider;
  final bool isActive;
  final bool isPaymentDone;
  final bool isBundleExpired;
  final bool isUserOk;

  const UserEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.mobileNo,
    required this.phoneNo,
    required this.whatsapp,
    required this.facebook,
    required this.location,
    required this.address,
    required this.userAvatar,
    required this.accessToken,
    required this.isSeller,
    required this.isAdmin,
    required this.isUser,
    required this.isProvider,
    required this.isActive,
    required this.isPaymentDone,
    required this.isBundleExpired,
    required this.isUserOk,
  });
}
