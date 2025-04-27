// import 'package:wrshaonline/app/warsha/data/models/common/bundle_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/companiesreg_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/user_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/country_model.dart';

// class GeneralUserModel {
//   String? type;
//   String? email;
//   String? pass;

//   CountryModel? countryModel; // Changed to follow Dart naming conventions
//   Bundle? bundle;
//   User? user; // This can cause confusion; consider renaming for clarity
//   CompaniesReg? companiesReg;
//   String? accessToken;

//   GeneralUserModel({
//     this.type,
//     this.email,
//     this.pass,
//     this.countryModel,
//     this.bundle,
//     this.user,
//     this.companiesReg,
//     this.accessToken,
//   });

//   // Convert User object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'type': type,
//       'email': email,
//       'pass': pass,
//       'countryModel': {
//         "name": countryModel!.name,
//         "CountryEn": countryModel!.countryEn,
//         "CountryAr": countryModel!.countryAr,
//         "Country_ISO_Code": countryModel!.countryISOCode,
//         "Currency_ISO_Code": countryModel!.currencyISOCode,
//         "CurrAr": countryModel!.currAr,
//         "Mobile_Country_Code": countryModel!.mobileCountryCode,
//         "flag": countryModel!.flag,
//       },
//       'bundle': bundle?.toJson(),
//       'user': user?.toJson(),
//       'companiesReg': companiesReg?.toJson(),
//       'accessToken': accessToken,
//     };
//   }

//   // Create User object from JSON
//   factory GeneralUserModel.fromJson(Map<String, dynamic> json) {
//     return GeneralUserModel(
//       type: json['type'],
//       email: json['email'],
//       pass: json['pass'],
//       countryModel: json['countryModel'] != null
//           ? CountryModel(
//               name: json['countryModel']["name"],
//               countryEn: json['countryModel']["CountryEn"],
//               countryAr: json['countryModel']["CountryAr"],
//               countryISOCode: json['countryModel']["Country_ISO_Code"],
//               currencyISOCode: json['countryModel']["Currency_ISO_Code"],
//               currAr: json['countryModel']["CurrAr"],
//               mobileCountryCode: json['countryModel']["Mobile_Country_Code"],
//               flag: json['countryModel']["flag"],
//             )
//           : null,
//       bundle: json['bundle'] != null ? Bundle.fromJson(json['bundle']) : null,
//       user: json['user'] != null ? User.fromJson(json['user']) : null,
//       companiesReg: json['companiesReg'] != null
//           ? CompaniesReg.fromJson(json['companiesReg'])
//           : null,
//       accessToken: json['accessToken'],
//     );
//   }
// }
