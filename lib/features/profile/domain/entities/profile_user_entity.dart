class ProfileUserEntity {
  final int id;
  final int countryId;
  final int regionId;
  final int cityId;
  final String userName;
  final String mobileno;
  final String phoneno;
  final String whatsapp;
  final String facebook;
  final String email;
  final String password;
  final String location;
  final String address;
  final String avatar;
  final String addedDate;
  final String bundlestartdate;
  final String bundleenddate;
  final int userType;
  final bool isSeller;
  final bool isAdmin;
  final bool isUser;
  final bool isProvider;
  final bool paperOk;
  final bool isPaymentDone;
  final int websitePercent;
  final bool otpVerificationDone;
  final bool isActive;
  final int orderCount;
  final int requestCount;
  final int buildingCount;
  final int paymentId;
  final int approvalAdminId;
  final bool hasAdminApproval;
  final String adminNote;
  final bool paymentDone;
  final int currentBundelMaxRequest;
  final int currentBundelMaxBuilding;
  final int currentBundelCurrentBuildingCount;
  final bool isBundleExpired;
  final int currentBundelCurrentRequest;
  final bool isUserOk;
  final String accessToken;

  const ProfileUserEntity({
    required this.id,
    required this.countryId,
    required this.regionId,
    required this.cityId,
    required this.userName,
    required this.mobileno,
    required this.phoneno,
    required this.whatsapp,
    required this.facebook,
    required this.email,
    required this.password,
    required this.location,
    required this.address,
    required this.avatar,
    required this.addedDate,
    required this.bundlestartdate,
    required this.bundleenddate,
    required this.userType,
    required this.isSeller,
    required this.isAdmin,
    required this.isUser,
    required this.isProvider,
    required this.paperOk,
    required this.isPaymentDone,
    required this.websitePercent,
    required this.otpVerificationDone,
    required this.isActive,
    required this.orderCount,
    required this.requestCount,
    required this.buildingCount,
    required this.paymentId,
    required this.approvalAdminId,
    required this.hasAdminApproval,
    required this.adminNote,
    required this.paymentDone,
    required this.currentBundelMaxRequest,
    required this.currentBundelMaxBuilding,
    required this.currentBundelCurrentBuildingCount,
    required this.isBundleExpired,
    required this.currentBundelCurrentRequest,
    required this.isUserOk,
    required this.accessToken,
  });
}
