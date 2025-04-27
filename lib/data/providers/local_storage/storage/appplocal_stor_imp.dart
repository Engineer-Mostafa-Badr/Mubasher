// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wrshaonline/app/warsha/data/models/country_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/general_user_model.dart';
// import 'dart:convert';

// import 'package:wrshaonline/app/warsha/data/providers/local_storage/storage/i_app_local_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';
// import 'package:wrshaonline/app/warsha/utils/helpers.dart';

// const String sharedPrefKeyLang = "Lang";
// const String sharedPrefSelectedCountry = "selectedCountry";
// const String sharedPrefuser = "user";

// const String sharedPrefauthToken = "authToken";
// const String sharedPrefRefreshToken = "refreshToken";

// const String customerType = "customer";
// const String companyType = "company";
// const String noUserType = "NoUser";
// const String cartidstr = "CartId";

// /*const String sharedPrefKeyOnboarding = "step";
// const String sharedPrefKeyLogin = "Login";
// const String sharedPrefKeyUserRole = "UserRole";
// const String sharedPrefKeyUserName = "UserName";
// const String sharedPrefKeyServerURL = "ServerURL";
// const String sharedPrefKeyusers_id = "users_id";
// const String sharedPrefKeyUserData = "userdata";

// const String sharedPrefKeyusers_phone = "users_phone";
// const String sharedPrefKeyusers_email = "users_email";
// const String sharedPrefKeyusers_verifycode = "users_verifycode";
// const String sharedPrefKeyusers_approve = "users_approve";
// const String sharedPrefKeyusers_create = "users_create";
// const String sharedPrefKeyusers_pass = "users_password";
// */

// class AppLocalStorageImp implements IAppLocalStorage {
//   late SharedPreferences shared;
//   Future<AppLocalStorageImp> init() async {
//     shared = await SharedPreferences.getInstance();
//     return this;
//   }

//   @override
//   Future<bool> deleteAll() async {
//     return await shared.clear();
//   }

//   @override
//   Future<bool> deleteValue(String key) async {
//     return await shared.remove(key);
//   }

//   @override
//   dynamic getValue(String key) {
//     try {
//       return shared.get(key);
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<bool> setValue(String key, dynamic value) async {
//     if (value is bool) {
//       return shared.setBool(key, value);
//     } else if (value is int) {
//       return shared.setInt(key, value);
//     } else if (value is double) {
//       return shared.setDouble(key, value);
//     } else if (value is String) {
//       return shared.setString(key, value);
//     } else if (value is List<String>) {
//       return shared.setStringList(key, value);
//     } else {
//       return shared.setString(key, value);
//     }
//   }

//   ////////////////C
//   ///Contry Setting
//   ///
//   Future<CountryModel?> getCountry() async {
//     // Retrieve the country data as a JSON string
//     String? countryJson = shared.getString(sharedPrefSelectedCountry);
//     // Convert the JSON string back to a Map<String, dynamic>
//     if (countryJson != null) {
//       Map<String, dynamic> countryMap = jsonDecode(countryJson);
//       return CountryModel(
//         name: countryMap["name"],
//         countryEn: countryMap["CountryEn"],
//         countryAr: countryMap["CountryAr"],
//         countryISOCode: countryMap["Country_ISO_Code"],
//         currencyISOCode: countryMap["Currency_ISO_Code"],
//         currAr: countryMap["CurrAr"],
//         mobileCountryCode: countryMap["Mobile_Country_Code"],
//         flag: countryMap["flag"],
//       );
//     }
//     return countries.first; // No country found
//   }

//   Future<bool> saveCountry(CountryModel country) async {
//     String countryJson = jsonEncode({
//       "name": country.name,
//       "CountryEn": country.countryEn,
//       "CountryAr": country.countryAr,
//       "Country_ISO_Code": country.countryISOCode,
//       "Currency_ISO_Code": country.currencyISOCode,
//       "CurrAr": country.currAr,
//       "Mobile_Country_Code": country.mobileCountryCode,
//       "flag": country.flag,
//     });
//     // Convert the Country object to a map and save it as a JSON string
//     return await shared.setString(sharedPrefSelectedCountry, countryJson);
//   }

//   ///User Model
//   ///
//   Future<GeneralUserModel> getUserModel() async {
//     String? userString = shared.getString(sharedPrefuser);

//     if (userString != null) {
//       LoggingService.debug(userString);
//       // Convert the string back to a GeneralUserModel object
//       //Map<String, dynamic> userMap =   Map<String, dynamic>.from(jsonDecode(userString));
//       var userList = jsonDecode(Base64Helper.decode(userString));
// // Access first user
//       //   Map<String, dynamic> userMap = Map<String, dynamic>.from(userList[0]);
//       var model = GeneralUserModel.fromJson(userList);
//       LoggingService.debug("$model");
//       return model;
//     }
//     return GeneralUserModel(type: noUserType); // Return null if no user found
//   }

//   Future<bool> saveUserModel(GeneralUserModel user) async {
//     try {
//       String str = Base64Helper.encode(jsonEncode(user.toJson()).toString());
//       LoggingService.debug(str);
//       return shared.setString(sharedPrefuser, str); // Save user as JSON string
//     } catch (e) {
//       LoggingService.error("$e");
//     }
//     return false;
//   }

//   ///
//   ///
//   ///Tokens
//   ///
//   ///
//   ///
//   Future<void> saveAuthToken(String token) async {
//     await shared.setString(sharedPrefauthToken, token);
//   }

//   Future<String?> getAuthToken() async {
//     return shared.getString(sharedPrefauthToken);
//   }

//   Future<void> saveRefreshToken(String token) async {
//     await shared.setString(sharedPrefRefreshToken, token);
//   }

//   Future<String?> getRefreshToken() async {
//     return shared.getString(sharedPrefRefreshToken);
//   }

//   Future<void> logoutuser() async {
//     await shared.remove(sharedPrefauthToken);
//     await shared.remove(sharedPrefuser);
//     await shared.remove(sharedPrefRefreshToken);
//   }

//   Future<void> clearTokens() async {
//     await shared.remove(sharedPrefauthToken);
//     await shared.remove(sharedPrefRefreshToken);
//   }
// }

// initialServices() async {
//   await Get.putAsync(() => AppLocalStorageImp().init());
//   // await Get.putAsync(() => LocalStorageProvider().init());
// }
