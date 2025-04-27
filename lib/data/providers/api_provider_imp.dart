// import 'dart:convert';
// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:mubasher_app/data/providers/api_provider.dart';

// enum StatusRequest {
//   none,
//   loading,
//   success,
//   failure,
//   serverfailure,
//   serverException,
//   offlinefailure,
//   error,
//   errorParsing,
//   idle,
//   serverError,
//   jsonfailure
// }

// class ApiServiceImp {
//   List<String> errorList = [];
//   Map<String, dynamic> validationErrors = {};

//   bool _usedio = false;

//   ApiServiceImp(bool usedio) {
//     _usedio = usedio;
//   }

//   Map<String, dynamic> listToMap(List<dynamic> list) {
//     Map<String, dynamic> map = {};
//     for (int i = 0; i < list.length; i += 2) {
//       String key = list[i].toString(); // Convert to string for the key
//       dynamic value = list[i + 1]; // Get the next element as value
//       map[key] = value;
//     }
//     return map;
//   }

//   final ApiService _apiService =
//       getControllerLazyPut<ApiService>(); // Get.find<ApiService>();
//   final DioClient _dioClient =
//       getControllerLazyPut<DioClient>(); //Get.find<DioClient>();

//   // General error handlers without snackbar
//   void handleDioMessage() {
//     if (!_dioClient.issuccess) {
//       LoggingService.error("Dio Error", _dioClient.messages);
//     }
//   }

//   void handleHttpMessage() {
//     if (!_apiService.issuccess) {
//       LoggingService.error("HTTP Error", _apiService.messages);
//     }
//   }

//   void handleErrorMessage() {
//     if (_usedio) {
//       handleDioMessage();
//     } else {
//       handleHttpMessage();
//     }
//   }

//   void handleErrorMessage2(e) {
//     errorList = [];
//     if (e is DioException) {
//       if (e.response != null && e.response!.data != null) {
//         var errors = e.response!.data['errors'];
//         if (errors != null && errors is Map<String, dynamic>) {
//           errorList = errors.values
//               .expand((value) => value as List)
//               .cast<String>()
//               .toList();
//           LoggingService.error("Error Listss :", errorList.toString());
//         }
//       }
//     } else {
//       LoggingService.error("Error occurred", e);
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> postRequest(
//       String endpoint, Map<String, dynamic> data) async {
//     if (_usedio) {
//       try {
//         final response = await _dioClient.postRequest(endpoint, data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = response.data;
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     } else {
//       try {
//         final response = await _apiService.postRequest(endpoint, data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = jsonDecode(response.body);
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> putRequest(
//       String endpoint, Map<String, dynamic> data) async {
//     if (_usedio) {
//       try {
//         final response = await _dioClient.putRequest(endpoint, data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = response.data;
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     } else {
//       try {
//         final response = await _apiService.putRequest(endpoint, data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = jsonDecode(response.body);
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> deleteRequest(
//       String endpoint) async {
//     if (_usedio) {
//       try {
//         final response = await _dioClient.deleteRequest(endpoint);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = response.data;
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     } else {
//       try {
//         final response = await _apiService.deleteRequest(endpoint);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = jsonDecode(response.body);
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> getRequest(
//       String endpoint,
//       {Map<String, dynamic>? queryParameters}) async {
//     if (_usedio) {
//       try {
//         final response = await _dioClient.getRequest(endpoint,
//             queryParameters: queryParameters);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = response.data;
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     } else {
//       try {
//         final response = await _apiService.getRequest(endpoint);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = jsonDecode(response.body);
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> submitFormData({
//     required String apiUrl,
//     required Map<String, String> formData,
//     File? singleFile,
//     File? videoFile,
//     List<File>? listFiles,
//     String singleFileField = 'file',
//     String listFilesField = 'files',
//     String videoFileField = 'video',
//   }) async {
//     if (_usedio) {
//       try {
//         final response = await _dioClient.submitFormData(
//             apiUrl: apiUrl,
//             formData: formData,
//             singleFile: singleFile,
//             listFiles: listFiles,
//             singleFileField: singleFileField,
//             listFilesField: listFilesField,
//             videoFile: videoFile,
//             videoFileField: videoFileField);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map<String, dynamic> responsebody = response.data;
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     } else {
//       try {
//         final response = await _apiService.submitFormData(
//             endpoint: apiUrl,
//             formData: formData,
//             singleFile: singleFile,
//             listFiles: listFiles,
//             singleFileField: singleFileField,
//             listFilesField: listFilesField,
//             videoFile: videoFile,
//             videoFileField: videoFileField);
//         if (_dioClient.issuccess) {
//           Map<String, dynamic> responsebody = jsonDecode(response);
//           return Right(responsebody);
//         } else {
//           handleErrorMessage();
//           return const Left(StatusRequest.serverException);
//         }
//       } catch (e, stacktrace) {
//         LoggingService.error("Error fetching data", e, stacktrace);
//         handleErrorMessage2(e);
//         return const Left(StatusRequest.serverException);
//       }
//     }
//   }
// }
