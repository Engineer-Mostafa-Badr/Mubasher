import 'package:mubasher_app/features/profile/domain/entities/profile_user_entity.dart';

class ProfileUserModel extends ProfileUserEntity {
  final List<UserAttachment> userAttachments;
  final List<UserPreviousWork> userPreviousWorks;

  ProfileUserModel({
    required super.id,
    required super.countryId,
    required super.regionId,
    required super.cityId,
    required super.userName,
    required super.mobileno,
    required super.phoneno,
    required super.whatsapp,
    required super.facebook,
    required super.email,
    required super.password,
    required super.location,
    required super.address,
    required super.avatar,
    required super.addedDate,
    required super.bundlestartdate,
    required super.bundleenddate,
    required super.userType,
    required super.isSeller,
    required super.isAdmin,
    required super.isUser,
    required super.isProvider,
    required super.paperOk,
    required super.isPaymentDone,
    required super.websitePercent,
    required super.otpVerificationDone,
    required super.isActive,
    required super.orderCount,
    required super.requestCount,
    required super.buildingCount,
    required super.paymentId,
    required super.approvalAdminId,
    required super.hasAdminApproval,
    required super.adminNote,
    required super.paymentDone,
    required super.currentBundelMaxRequest,
    required super.currentBundelMaxBuilding,
    required super.currentBundelCurrentBuildingCount,
    required super.isBundleExpired,
    required super.currentBundelCurrentRequest,
    required super.isUserOk,
    required super.accessToken,
    required this.userAttachments,
    required this.userPreviousWorks,
  });

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      id: json['id'] ?? 0,
      countryId: json['country_id'] ?? 0,
      regionId: json['region_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      userName: json['user_name'] ?? '',
      mobileno: json['mobileno'] ?? '',
      phoneno: json['phoneno'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      facebook: json['facebook'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      location: json['locationn'] ?? '',
      address: json['adress'] ?? '',
      avatar: json['user_avater'] ?? '',
      addedDate: json['added_date'] ?? '',
      bundlestartdate: json['bundlestartdate'] ?? '',
      bundleenddate: json['bundleenddate'] ?? '',
      userType: json['user_type'] ?? 0,
      isSeller: json['is_seller'] ?? false,
      isAdmin: json['is_admin'] ?? false,
      isUser: json['is_user'] ?? false,
      isProvider: json['is_provider'] ?? false,
      paperOk: json['paper_ok'] ?? false,
      isPaymentDone: json['ispaymentdone'] ?? false,
      websitePercent: json['websitepercent'] ?? 0,
      otpVerificationDone: json['otp_verification_done'] ?? false,
      isActive: json['is_active'] ?? true,
      orderCount: json['ordercount'] ?? 0,
      requestCount: json['requestcount'] ?? 0,
      buildingCount: json['buildingcount'] ?? 0,
      paymentId: json['paymentid'] ?? 0,
      approvalAdminId: json['approvaladminid'] ?? 0,
      hasAdminApproval: json['hasadminapproval'] ?? false,
      adminNote: json['adminnote'] ?? '',
      paymentDone: json['paymentDone'] ?? false,
      currentBundelMaxRequest: json['currentBundelMaxRequest'] ?? 0,
      currentBundelMaxBuilding: json['currentBundelMaxBuilding'] ?? 0,
      currentBundelCurrentBuildingCount:
          json['currentBundelCurrentBuildingCount'] ?? 0,
      isBundleExpired: json['isbundleExpired'] ?? false,
      currentBundelCurrentRequest: json['currentBundelCurrentRequest'] ?? 0,
      isUserOk: json['isUserOk'] ?? false,
      accessToken: json['accessToken'] ?? '',
      userAttachments:
          (json['userAttachments'] as List<dynamic>?)
              ?.map((e) => UserAttachment.fromJson(e))
              .toList() ??
          [],
      userPreviousWorks:
          (json['userPreviousWorks'] as List<dynamic>?)
              ?.map((e) => UserPreviousWork.fromJson(e))
              .toList() ??
          [],
    );
  }
  ProfileUserModel copyWith({
    String? userName,
    String? email,
    String? phoneno,
    String? whatsapp,
  }) {
    return ProfileUserModel(
      id: id,
      countryId: countryId,
      regionId: regionId,
      cityId: cityId,
      userName: userName ?? this.userName,
      mobileno: mobileno,
      phoneno: phoneno ?? this.phoneno,
      whatsapp: whatsapp ?? this.whatsapp,
      facebook: facebook,
      email: email ?? this.email,
      password: password,
      location: location,
      address: address,
      avatar: avatar,
      addedDate: addedDate,
      bundlestartdate: bundlestartdate,
      bundleenddate: bundleenddate,
      userType: userType,
      isSeller: isSeller,
      isAdmin: isAdmin,
      isUser: isUser,
      isProvider: isProvider,
      paperOk: paperOk,
      isPaymentDone: isPaymentDone,
      websitePercent: websitePercent,
      otpVerificationDone: otpVerificationDone,
      isActive: isActive,
      orderCount: orderCount,
      requestCount: requestCount,
      buildingCount: buildingCount,
      paymentId: paymentId,
      approvalAdminId: approvalAdminId,
      hasAdminApproval: hasAdminApproval,
      adminNote: adminNote,
      paymentDone: paymentDone,
      currentBundelMaxRequest: currentBundelMaxRequest,
      currentBundelMaxBuilding: currentBundelMaxBuilding,
      currentBundelCurrentBuildingCount: currentBundelCurrentBuildingCount,
      isBundleExpired: isBundleExpired,
      currentBundelCurrentRequest: currentBundelCurrentRequest,
      isUserOk: isUserOk,
      accessToken: accessToken,
      userAttachments: userAttachments,
      userPreviousWorks: userPreviousWorks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "country_id": countryId,
      "region_id": regionId,
      "city_id": cityId,
      "user_name": userName,
      "mobileno": mobileno,
      "phoneno": phoneno,
      "whatsapp": whatsapp,
      "facebook": facebook,
      "email": email,
      "password": password,
      "locationn": location,
      "adress": address,
      "user_avater": avatar,
      "added_date": addedDate,
      "bundlestartdate": bundlestartdate,
      "bundleenddate": bundleenddate,
      "user_type": userType,
      "is_seller": isSeller,
      "is_admin": isAdmin,
      "is_user": isUser,
      "is_provider": isProvider,
      "paper_ok": paperOk,
      "ispaymentdone": isPaymentDone,
      "websitepercent": websitePercent,
      "otp_verification_done": otpVerificationDone,
      "is_active": isActive,
      "ordercount": orderCount,
      "requestcount": requestCount,
      "buildingcount": buildingCount,
      "paymentid": paymentId,
      "approvaladminid": approvalAdminId,
      "hasadminapproval": hasAdminApproval,
      "adminnote": adminNote,
      "paymentDone": paymentDone,
      "currentBundelMaxRequest": currentBundelMaxRequest,
      "currentBundelMaxBuilding": currentBundelMaxBuilding,
      "currentBundelCurrentBuildingCount": currentBundelCurrentBuildingCount,
      "isbundleExpired": isBundleExpired,
      "currentBundelCurrentRequest": currentBundelCurrentRequest,
      "isUserOk": isUserOk,
      "accessToken": accessToken,
      "userAttachments": userAttachments.map((e) => e.toJson()).toList(),
      "userPreviousWorks": userPreviousWorks.map((e) => e.toJson()).toList(),
    };
  }

  factory ProfileUserModel.fromEntity(ProfileUserEntity entity) {
    return ProfileUserModel(
      id: entity.id,
      countryId: entity.countryId,
      regionId: entity.regionId,
      cityId: entity.cityId,
      userName: entity.userName,
      mobileno: entity.mobileno,
      phoneno: entity.phoneno,
      whatsapp: entity.whatsapp,
      facebook: entity.facebook,
      email: entity.email,
      password: entity.password,
      location: entity.location,
      address: entity.address,
      avatar: entity.avatar,
      addedDate: entity.addedDate,
      bundlestartdate: entity.bundlestartdate,
      bundleenddate: entity.bundleenddate,
      userType: entity.userType,
      isSeller: entity.isSeller,
      isAdmin: entity.isAdmin,
      isUser: entity.isUser,
      isProvider: entity.isProvider,
      paperOk: entity.paperOk,
      isPaymentDone: entity.isPaymentDone,
      websitePercent: entity.websitePercent,
      otpVerificationDone: entity.otpVerificationDone,
      isActive: entity.isActive,
      orderCount: entity.orderCount,
      requestCount: entity.requestCount,
      buildingCount: entity.buildingCount,
      paymentId: entity.paymentId,
      approvalAdminId: entity.approvalAdminId,
      hasAdminApproval: entity.hasAdminApproval,
      adminNote: entity.adminNote,
      paymentDone: entity.paymentDone,
      currentBundelMaxRequest: entity.currentBundelMaxRequest,
      currentBundelMaxBuilding: entity.currentBundelMaxBuilding,
      currentBundelCurrentBuildingCount:
          entity.currentBundelCurrentBuildingCount,
      isBundleExpired: entity.isBundleExpired,
      currentBundelCurrentRequest: entity.currentBundelCurrentRequest,
      isUserOk: entity.isUserOk,
      accessToken: entity.accessToken,
      userAttachments: entity is ProfileUserModel ? entity.userAttachments : [],
      userPreviousWorks:
          entity is ProfileUserModel ? entity.userPreviousWorks : [],
    );
  }
}

// ----------------------------

class UserAttachment {
  int id;
  int userId;
  String attachment;
  String details;
  bool isActive;

  UserAttachment({
    required this.id,
    required this.userId,
    required this.attachment,
    required this.details,
    required this.isActive,
  });

  factory UserAttachment.fromJson(Map<String, dynamic> json) {
    return UserAttachment(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      attachment: json['attachment'] ?? '',
      details: json['details'] ?? '',
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "attachment": attachment,
      "details": details,
      "is_active": isActive,
    };
  }
}

// ----------------------------

class UserPreviousWork {
  int id;
  int userId;
  String attachment;
  String titleAr;
  String titleEn;
  String detailsAr;
  String detailsEn;
  int approvalAdminId;
  bool hasAdminApproval;
  String adminNote;
  bool isActive;

  UserPreviousWork({
    required this.id,
    required this.userId,
    required this.attachment,
    required this.titleAr,
    required this.titleEn,
    required this.detailsAr,
    required this.detailsEn,
    required this.approvalAdminId,
    required this.hasAdminApproval,
    required this.adminNote,
    required this.isActive,
  });

  factory UserPreviousWork.fromJson(Map<String, dynamic> json) {
    return UserPreviousWork(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      attachment: json['attachment'] ?? '',
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      detailsAr: json['details_ar'] ?? '',
      detailsEn: json['details_en'] ?? '',
      approvalAdminId: json['approvaladminid'] ?? 0,
      hasAdminApproval: json['hasadminapproval'] ?? false,
      adminNote: json['adminnote'] ?? '',
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "attachment": attachment,
      "title_ar": titleAr,
      "title_en": titleEn,
      "details_ar": detailsAr,
      "details_en": detailsEn,
      "approvaladminid": approvalAdminId,
      "hasadminapproval": hasAdminApproval,
      "adminnote": adminNote,
      "is_active": isActive,
    };
  }
}
