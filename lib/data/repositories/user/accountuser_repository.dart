// import 'package:dartz/dartz.dart';
// import 'package:wrshaonline/app/warsha/data/providers/api_provider_imp.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/shared_preferences_service.dart';
// import 'package:wrshaonline/app/warsha/utils/constants.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';
// import 'package:wrshaonline/app/warsha/bindings/hoome_binding.dart';

// //import 'package:wrshaonline/app/warsha/routes/app_routes.dart';
// class AccountUserRepository {
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();
//   Future<Either<StatusRequest, dynamic>> verifyCode(
//       {required String email,
//       required String whatsapp,
//       required String phone,
//       required String methodResponse,
//       required String otp}) async {
//     try {
//       final payload = {
//         "email": email,
//         "whatsapp": whatsapp,
//         "phone": phone,
//         "methodResponse": "string",
//         "otp": "string"
//       };

//       final result = await _apiService.postRequest(
//         AppLink.userAuthUserverfiy, // The URL for verifying the code
//         payload,
//       );

//       return result.fold(
//         (status) {
//           // Log the error or status if needed
//           return Left(status);
//         },
//         (responseBody) {
//           // Handle success response
//           return Right(responseBody);
//         },
//       );
//     } catch (e) {
//       // Handle unexpected errors
//       return const Left(
//           StatusRequest.serverfailure); // You can customize this to your needs
//     }
//   }

//   Future<Either<StatusRequest, dynamic>> resetPassword({
//     required String email,
//     required String whatsapp,
//     required String phone,
//     required String methodResponse,
//     required String otp,
//     required String newPassword,
//   }) async {
//     try {
//       final payload = {
//         'email': email,
//         'whatsapp': whatsapp,
//         'phone': phone,
//         'methodResponse': methodResponse,
//         'otp': otp,
//         'newPassword': newPassword,
//       };

//       // Assuming the URL is for password reset
//       final result = await _apiService.postRequest(
//         AppLink
//             .userAuthUserResetPassword, // Replace with the actual password reset endpoint
//         payload,
//       );

//       // Handle the result
//       return result.fold(
//         (status) {
//           LoggingService.error('Failed to reset password: $status');
//           return Left(status);
//         },
//         (responseBody) {
//           LoggingService.info('Password reset successfully: $responseBody');
//           return Right(responseBody);
//         },
//       );
//     } catch (e, stackTrace) {
//       LoggingService.error(
//           'Unexpected error during password reset: $e\n$stackTrace');
//       return const Left(StatusRequest.serverfailure);
//     }
//   }

//   Future<Either<StatusRequest, dynamic>> activeuserotp({
//     required String email,
//     required String whatsapp,
//     required String phone,
//     required String methodResponse,
//     required String otp,
//     required String newPassword,
//   }) async {
//     try {
//       final payload = {
//         'email': email,
//         'whatsapp': whatsapp,
//         'phone': phone,
//         'methodResponse': methodResponse,
//         'otp': otp,
//         'newPassword': newPassword,
//       };

//       // Assuming the URL is for password reset
//       final result = await _apiService.postRequest(
//         AppLink
//             .userAuthUserActiveuserotp, // Replace with the actual password reset endpoint
//         payload,
//       );

//       // Handle the result
//       return result.fold(
//         (status) {
//           LoggingService.error('Failed to reset password: $status');
//           return Left(status);
//         },
//         (responseBody) {
//           LoggingService.info('Password reset successfully: $responseBody');
//           return Right(responseBody);
//         },
//       );
//     } catch (e, stackTrace) {
//       LoggingService.error(
//           'Unexpected error during password reset: $e\n$stackTrace');
//       return const Left(StatusRequest.serverfailure);
//     }
//   }

//   /* Future<Either<StatusRequest, ChangePassword>> changePasswordPost({
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword,
//   }) async {
//     try {
//       // إعداد البيانات لإرسالها مع الطلب
//       final Map<String, String> data = {
//         "oldPassword": oldPassword,
//         "newPassword": newPassword,
//         "confirmPassword": confirmPassword,
//       };

//       // استدعاء الخدمة لإرسال الطلب
//       final result = await _apiService.postRequest(
//         AppLink.companyAccountCompanyChangePassword,
//         data,
//       );

//       // معالجة الاستجابة
//       return result.fold(
//             (status) {
//           // تسجيل رسالة الخطأ
//           LoggingService.error('Error while changing password: $status');
//           return Left(status);
//         },
//             (responseBody) {
//           try {
//             // تحويل الاستجابة إلى كائن ChangePassword
//             final ChangePassword model = ChangePassword.fromJson(responseBody);

//             // تسجيل النجاح
//             LoggingService.info(
//                 'Password changed successfully: ${model.newPassword}');
//             return Right(model);
//           } catch (jsonError) {
//             // التعامل مع خطأ التحويل من JSON
//             LoggingService.error('JSON parsing error: $jsonError');
//             return Left(StatusRequest.jsonfailure);
//           }
//         },
//       );
//     } catch (e, stackTrace) {
//       // تسجيل أي استثناءات غير متوقعة مع StackTrace للتصحيح
//       LoggingService.error('Unexpected error: $e\nStackTrace: $stackTrace');
//       return Left(StatusRequest.serverfailure);
//     }
//   }*/
//   Future<Either<StatusRequest, dynamic>> resendCode(
//       {required String email,
//       required String whatsapp,
//       required String phone,
//       required String methodResponse,
//       required String otp}) async {
//     try {
//       // Prepare payload for the API request
//       final payload = {
//         "email": email,
//         "whatsapp": whatsapp,
//         "phone": phone,
//         "methodResponse": "string",
//         "otp": "string"
//       };

//       // Make the API call using your API service
//       final result = await _apiService.postRequest(
//         AppLink
//             .userAuthUserForgotPassword, // Replace with your resend OTP endpoint
//         payload,
//       );

//       // Handle the response
//       return result.fold(
//         (status) {
//           LoggingService.error('Failed to resend OTP: $status');
//           return Left(status);
//         },
//         (responseBody) {
//           LoggingService.info('OTP resent successfully: $responseBody');
//           return Right(responseBody);
//         },
//       );
//     } catch (e, stackTrace) {
//       LoggingService.error(
//           'Unexpected error during OTP resend: $e\n$stackTrace');
//       return const Left(StatusRequest.serverfailure);
//     }
//   }

//   Future<Either<StatusRequest, dynamic>> sendPasswordToEmail(
//       {required String email}) async {
//     try {
//       // إعداد البيانات لإرسالها
//       final data = {"email": email};

//       // استدعاء الـ API
//       final result = await _apiService.postRequest(
//         AppLink.userSendPasswordToEmail, // رابط الـ API الخاص بالإرسال
//         data,
//       );

//       // التعامل مع الاستجابة
//       return result.fold(
//         (status) => Left(status),
//         (responseBody) => Right(responseBody), // ارجع الاستجابة عند النجاح
//       );
//     } catch (e) {
//       // في حال وجود خطأ غير متوقع
//       return const Left(StatusRequest.serverfailure);
//     }
//   }

//   Future<Either<StatusRequest, dynamic>> sendOtpRequest({
//     required String email,
//     required String whatsapp,
//     required String phone,
//     required String methodResponse,
//   }) async {
//     try {
//       // Prepare payload for the API request
//       final payload = {
//         "email": email,
//         "whatsapp": whatsapp,
//         "phone": phone,
//         "methodResponse": methodResponse
//       };

//       // Make the API call using ApiServiceImp
//       final result = await _apiService.postRequest(
//         AppLink.userAuthUserForgotPassword, // Replace with the actual endpoint
//         payload,
//       );

//       // Handle the response
//       return result.fold(
//         (status) {
//           LoggingService.error('Failed to send OTP: $status');
//           return Left(status);
//         },
//         (responseBody) {
//           LoggingService.info('OTP sent successfully: $responseBody');
//           return Right(responseBody);
//         },
//       );
//     } catch (e, stackTrace) {
//       LoggingService.error(
//           'Unexpected error during OTP request: $e\n$stackTrace');
//       return const Left(StatusRequest.serverfailure);
//     }
//   }
// }
