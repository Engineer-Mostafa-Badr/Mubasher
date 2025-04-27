// import 'package:get/get.dart';
// import 'package:dartz/dartz.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/user_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/userresponsedto_model.dart';

// import 'package:wrshaonline/app/warsha/data/models/country_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/general_user_model.dart';
// import 'package:wrshaonline/app/warsha/data/providers/api_provider_imp.dart';
// import 'package:wrshaonline/app/warsha/data/common_call.dart';

// import 'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';

// class UserRepository {
//   final GeneralUserModel userModel = GeneralUserModel();
//   List<String> errorList = [];
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();
//   final TokenStorage _tokenStorage = TokenStorage();
//   var requestSuccess = false.obs();
//   Future<Either<StatusRequest, User>> fetchUserData(int id) async {
//     //var success = false.obs();

//     // Call the API service to fetch the user
//     final result = await _apiService.getRequest(
//       AppLink.userAccountUserUserById.replaceAll("{Id}", id.toString()),
//     );

//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//           status,
//         ); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         UserResponseDTO model = UserResponseDTO.fromJson(responseBody);
//         // On success, print the user details and return Right with the user
//         //LoggingService.debug('User: ${model.fullname}');
//         return Right(
//           model.datac![0],
//         ); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, UserResponseDTO>> updateUser(
//     int userId,
//     User user,
//   ) async {
//     try {
//       // إرسال طلب POST لتحديث بيانات المستخدم
//       final response = await _apiService.postRequest(
//         AppLink.userAccountUserEdit.replaceAll("{id}", userId.toString()),
//         user.toJson(),
//       );

//       // التحقق من نتيجة الاستجابة
//       return response.fold(
//         (status) {
//           // تسجيل الخطأ وإرجاع الحالة
//           LoggingService.debug('Error: $status');
//           return Left(status); // إرجاع الحالة في حالة الخطأ
//         },
//         (responseBody) {
//           // تحويل البيانات إلى كائن UserResponseDTO
//           UserResponseDTO model = UserResponseDTO.fromJson(responseBody);
//           return Right(model); // إرجاع البيانات في حالة النجاح
//         },
//       );
//     } catch (e) {
//       // التعامل مع أي استثناءات قد تحدث
//       LoggingService.debug('Exception: $e');
//       return const Left(StatusRequest.error); // إرجاع حالة خطأ عامة
//     }
//   }

//   Future<Either<StatusRequest, UserResponseDTO>> delete(String id) async {
//     // Call the API service to fetch the CompaniesRegs
//     final result = await _apiService.deleteRequest(
//       AppLink.userUsersDelete.replaceAll('{id}', id),
//     );
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//           status,
//         ); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         UserResponseDTO model = UserResponseDTO.fromJson(responseBody);

//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }
//   /*
 

// */
//   /*Future<dynamic> deleteUser(int userId) async {
//     return await _apiService.deleteRequest(       AppLink.userAccountUserDelete // Function to convert JSON response to User object
//         );
//   }*/

//   // Login method
//   Future<Either<StatusRequest, UserResponseDTO>> makelogin(
//     String username,
//     String password,
//   ) async {
//     try {
//       final result = await _apiService.postRequest(
//         AppLink.userAuthUserLogin,
//         {
//           'username': username,
//           'password': password,
//         }, // Function to convert JSON response to User object
//       );
//       // معالجة الاستجابة
//       return result.fold(
//         (status) {
//           LoggingService.error('Error fetching banners: $status');
//           return Left(status); // إرجاع الخطأ في حالة الفشل
//         },
//         (responseBody) {
//           UserResponseDTO model = UserResponseDTO.fromJson(responseBody);
//           if (model.isSuccess) {
//             /*   String accessToken = model.datac![0].accessToken!
//                 .replaceAll("{ token =", "")
//                 .replaceAll("}", "")
//                 .trim();
// */
//             return Right(model); // إرجاع البيانات في حالة النجاح
//           } else {
//             LoggingService.error(
//               'Exception in getBanner: ${model.errors} ${model.message}',
//             );
//             return const Left(StatusRequest.error); // التعامل مع الاستثناءات
//           }
//         },
//       );
//     } catch (e) {
//       LoggingService.error('Exception in getBanner: $e');
//       return const Left(StatusRequest.error); // التعامل مع الاستثناءات
//     }
//   }

//   Future<bool> login(String username, String password) async {
//     requestSuccess = false;
//     try {
//       final response = await makelogin(username, password);

//       response.fold(
//         (status) {
//           return false;
//         },
//         (model) async {
//           requestSuccess = model.isSuccess;
//           if (model.isSuccess) {
//             String accessToken =
//                 model.datac![0].accessToken!
//                     .replaceAll("{ token =", "")
//                     .replaceAll("}", "")
//                     .trim();
//             userModel.user = model.datac![0];
//             userModel.type = customerType;
//             userModel.email = model.datac![0].email;
//             userModel.pass = model.datac![0].pass;
//             userModel.accessToken = accessToken;

//             try {
//               var selectedCountrys = countries.firstWhere(
//                 (country) => country.name == model.datac![0].country,
//                 //orElse: () => selectedCountry, // Keep the default if not found
//               );
//               userModel.countryModel = selectedCountrys;
//             } catch (e) {
//               var selectedCountrys = countries.first;
//               userModel.countryModel = selectedCountrys;
//             }

//             await appstorage.saveUserModel(userModel);
//             // await appstorage.saveCountry(selectedCountrys);
//             await appstorage.saveAuthToken(accessToken);
//             //await _tokenStorage.saveAuthTokenToStorage(accessToken);
//             // await _tokenStorage.saveRefreshTokenToStorage(accessToken);
//             //await LocalStorageProvider.saveRefreshToken(accessToken);
//             return true;
//           } else {
//             return false;
//           }
//         },
//       );
//     } catch (e, stacktrace) {
//       LoggingService.error("Error delete  data", e, stacktrace);
//       return false;
//     }
//     return false;
//   }

//   // Register method
//   Future<Either<StatusRequest, UserResponseDTO>> makeregister(User user) async {
//     try {
//       final result = await _apiService.postRequest(
//         AppLink.userAuthUserRegister,
//         {
//           "fullname": user.fullname,
//           "email": user.email,
//           "phoneno": user.phoneNo,
//           "pass": user.pass,
//           "confirm_Password": user.pass,
//           "whatsapp": user.whatsapp,
//           "country": user.country,
//         }, // Function to convert JSON response to User object
//       );
//       // معالجة الاستجابة
//       return result.fold(
//         (status) {
//           LoggingService.error('Error fetching banners: $status');
//           errorList = _apiService.errorList;
//           return Left(status); // إرجاع الخطأ في حالة الفشل
//         },
//         (responseBody) async {
//           UserResponseDTO model = UserResponseDTO.fromJson(responseBody);
//           if (model.isSuccess) {
//             String accessToken =
//                 model.datac![0].accessToken!
//                     .replaceAll("{ token =", "")
//                     .replaceAll("}", "")
//                     .trim();
//             userModel.user = model.datac![0];
//             userModel.type = customerType;
//             userModel.email = model.datac![0].email;
//             userModel.pass = model.datac![0].pass;
//             userModel.accessToken = accessToken;
//             try {
//               var selectedCountrys = countries.firstWhere(
//                 (country) => country.name == model.datac![0].country,
//                 //orElse: () => selectedCountry, // Keep the default if not found
//               );
//               userModel.countryModel = selectedCountrys;
//             } catch (e) {
//               var selectedCountrys = countries.first;
//               userModel.countryModel = selectedCountrys;
//             }
//             await appstorage.saveUserModel(userModel);
//             //   await appstorage.saveCountry(selectedCountrys);

//             return Right(model); // إرجاع البيانات في حالة النجاح
//           } else {
//             LoggingService.error(
//               'Exception in getBanner: ${model.errors} ${model.message}',
//             );
//             return const Left(StatusRequest.error); // التعامل مع الاستثناءات
//           }
//         },
//       );
//     } catch (e) {
//       LoggingService.error('Exception in getBanner: $e');
//       return const Left(StatusRequest.error); // التعامل مع الاستثناءات
//     }
//   }

//   Future<bool> register(User user) async {
//     requestSuccess = false;
//     try {
//       final result = await makeregister(user);

//       return result.fold(
//         (status) {
//           return false;
//         },
//         (model) {
//           requestSuccess = model.isSuccess;
//           if (model.isSuccess) {
//             String accessToken =
//                 model.datac![0].accessToken!
//                     .replaceAll("{ token =", "")
//                     .replaceAll("}", "")
//                     .trim();
//             appstorage.saveAuthToken(accessToken);
//             //   await _tokenStorage.saveAuthTokenToStorage(accessToken);
//             //  await _tokenStorage.saveRefreshTokenToStorage(accessToken);
//             //await LocalStorageProvider.saveRefreshToken(accessToken);
//             return true;
//           } else {
//             return false;
//           }
//         },
//       );
//     } catch (e, stacktrace) {
//       LoggingService.error("Error register data", e, stacktrace);
//       return false;
//     }
//   }

//   // Logout method (optional)
//   Future<void> logout() async {
//     // Clear tokens from storage
//     await _tokenStorage.clearTokens();
//     await appstorage.logoutuser();
//     await appstorage.logoutuser();
//   }
// }



// /*

// //
// void main() {
//   // Register ApiServiceImpT with the parameter `true`
  

//   runApp(MyApp());
// }
// Or, you can use lazyPut to initialize it lazily when needed:

// void main() {
//   // Register lazily with the parameter `true`
//   Get.lazyPut<ApiServiceImpT>(() => ApiServiceImpT(true));

//   runApp(MyApp());
// }

// login():

//     This method sends a POST request with the username and password to the /auth/login endpoint via ApiService.
//     On successful login, it stores the access and refresh tokens using TokenStorage.
//     Returns true if the login is successful, otherwise returns false.

// register():

//     This method sends a POST request with user registration details (username, email, and password) to the /auth/register endpoint.
//     If registration is successful, it can automatically log the user in by storing the access and refresh tokens.
//     Returns true on successful registration and token storage, otherwise returns false.

// logout():

//     Clears the stored tokens using TokenStorage.clearTokens(). This can be called when the user logs out.

// */