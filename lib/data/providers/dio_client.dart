// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'package:wrshaonline/app/warsha/data/common_call.dart';

// import 'package:path/path.dart';
// import 'dart:convert';

// class DioClient {
//   bool issuccess = false;
//   String messages = "";
//   late Dio _dio;
//   List<String> errorList = [];
//   Map<String, dynamic> validationErrors = {};
//   String _baseUrl = AppLink.baseUrl;

//   DioClient() {
//     _dio = Dio(BaseOptions(
//       baseUrl: AppLink.baseUrl,
//       connectTimeout: const Duration(milliseconds: 50000),
//       receiveTimeout: const Duration(milliseconds: 30000),
//     ));

//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         // Get the auth token from shared preferences
//         String? token = await appstorage.getAuthToken();

//         // Add the token to the request headers if it exists
//         if (token != null) {
//           options.headers["Authorization"] = "Bearer $token";
//         }

//         // Continue with the request
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         // Log or modify the response if necessary
//         return handler.next(response);
//       },
//       onError: (DioException error, handler) async {
//         // Log the error but don't show it to the user
//         LoggingService.error("Error occurred", error, error.stackTrace);

//         // Continue error handling without showing a message
//         return handler.next(error);
//       },
//     ));
//   }

//   Dio get dio => _dio;

//   Future<Response> getRequest(String path,
//       {Map<String, dynamic>? queryParameters}) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(path, "getRequest", {});
//       var response =
//           await _dio.get(_baseUrl + path, queryParameters: queryParameters);
//       issuccess = true;
//       _logRequest(path, response);
//       return response;
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       rethrow;
//     }
//   }

//   Future<Response> postRequest(String path, Map<String, dynamic> data) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(path, "postRequest", data);
//       var response = await _dio.post(_baseUrl + path, data: data);
//       issuccess = true;
//       _logRequest(path, response);
//       return response;
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       rethrow;
//     }
//   }

//   Future<Response> putRequest(String path, Map<String, dynamic> data) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(path, "putRequest", data);
//       var response = await _dio.put(_baseUrl + path, data: data);
//       issuccess = true;
//       _logRequest(path, response);
//       return response;
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       rethrow;
//     }
//   }

//   Future<Response> deleteRequest(String path) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(path, "deleteRequest", {});
//       var response = await _dio.delete(_baseUrl + path);
//       issuccess = true;
//       _logRequest(path, response);
//       return response;
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       rethrow;
//     }
//   }

//   void _logRequest(String endpoint, dynamic response) {
//     if (showReposnseRequest) {
//       LoggingService.debug(
//           "Request to: $endpoint Response: ${response.statusCode}' \n Response ${response.data}");
//     } else {
//       LoggingService.debug(
//           "Request to: $endpoint Response: ${response.statusCode} ");
//     }
//   }

//   void _logRequestprfix(
//       String endpoint, String proccesname, Map<String, dynamic> data) {
//     if (showReposnseRequest) {
//       String str = jsonEncode(data).toString();
//       LoggingService.debug(
//           "start ($proccesname) \n Request URL: $endpoint  \n  Send Body: $str");
//     } else {
//       LoggingService.debug("start ($proccesname) \n Request URL: $endpoint");
//     }
//   }

//   Future<Response> submitFormData({
//     required String apiUrl,
//     required Map<String, String> formData,
//     File? singleFile,
//     File? videoFile,
//     List<File>? listFiles,
//     String singleFileField = 'CompLogo',
//     String listFilesField = 'CompAttachment',
//     String videoFileField = 'video',
//   }) async {
//     issuccess = false;
//     try {
//       FormData formDataObject = FormData();

//       formData.forEach((key, value) {
//         formDataObject.fields.add(MapEntry(key, value));
//       });

//       if (singleFile != null) {
//         formDataObject.files.add(
//           MapEntry(
//             singleFileField,
//             await MultipartFile.fromFile(
//               singleFile.path,
//               filename: basename(singleFile.path),
//             ),
//           ),
//         );
//       }

//       if (videoFile != null) {
//         formDataObject.files.add(
//           MapEntry(
//             videoFileField,
//             await MultipartFile.fromFile(
//               videoFile.path,
//               filename: basename(videoFile.path),
//             ),
//           ),
//         );
//       }

//       if (listFiles != null && listFiles.isNotEmpty) {
//         for (var file in listFiles) {
//           formDataObject.files.add(
//             MapEntry(
//               listFilesField,
//               await MultipartFile.fromFile(
//                 file.path,
//                 filename: basename(file.path),
//               ),
//             ),
//           );
//         }
//       }

//       var response = await _dio.post(
//         apiUrl,
//         data: formDataObject,
//         options: Options(
//           headers: {
//             "Content-Type": "multipart/form-data",
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         messages = "Success: Data submitted successfully";
//         issuccess = true;
//         return response;
//       } else {
//         LoggingService.error("Error Failed to submit data");
//         messages = "Error Failed to submit data";
//         issuccess = false;
//         return response;
//       }
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       messages = "Error An error occurred: $e";
//       issuccess = false;
//       rethrow;
//     }
//   }
// }
