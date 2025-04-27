// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:wrshaonline/app/warsha/data/providers/validation_error_exception.dart';
// import 'package:wrshaonline/app/warsha/utils/constants.dart';
// import 'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';

// import 'package:path/path.dart';

// class ApiService extends GetxService {
//   bool issuccess = false;
//   String messages = "";
//   String _baseUrl = AppLink.baseUrl;
//   List<String> errorList = [];
//   Map<String, dynamic> validationErrors = {};

//   final Duration _timeout = const Duration(seconds: 30);
//   final TokenStorage _tokenStorage = TokenStorage(); // Token storage instance
//   //in case of basic auth
//   //String _basicAuth = 'Basic ' + base64Encode(utf8.encode('wael:wael12345'));
//   //Map<String, String> myheaders = {'authorization': _basicAuth};

//   // Example: token for authorization (you can modify this as per your logic)
//   String? authToken;
//   ApiService() {
//     _initAuthToken();
//   }
//   // Initialize authToken from storage
//   Future<void> _initAuthToken() async {
//     authToken = await _tokenStorage.getAuthTokenFromStorage();
//   }

//   // Function to intercept and modify requests (e.g., adding authorization headers)
//   Future<Map<String, String>> _addHeaders(Map<String, String>? headers) async {
//     headers ??= {};
//     if (authToken != null) {
//       headers['Authorization'] = 'Bearer $authToken';
//     }

//     headers['Content-Type'] = 'application/json';
//     return headers;
//   }

//   // Function to log request and response for debugging (Optional)
//   void _logRequest(String endpoint, dynamic response) {
//     // LoggingService.debug('Response: ${response.statusCode} -> ${response.body}');
//     if (showReposnseRequest) {
//       LoggingService.debug(
//           "Request to: $endpoint Response: ${response.statusCode}' \n Response ${response.body}");
//     } else {
//       LoggingService.debug(
//           "Request to: $endpoint Response: ${response.statusCode} ");
//     }
//   }

//   void _logRequestprfix(String endpoint, String proccesname) {
//     LoggingService.debug("start ($proccesname) \n Request URL: $endpoint");

//     // LoggingService.debug('Response: ${response.statusCode} -> ${response.body}');
//   }

// /*
//   // Token refresh logic (example)
//   Future<bool> _refreshToken() async {
//     String? refreshToken = await _tokenStorage.getRefreshTokenFromStorage();

//     if (refreshToken == null) {
//       throw Exception('No refresh token found');
//     }

//     final response = await http.post(
//       Uri.parse(_baseUrl + AppLink.refresh),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'refresh_token': refreshToken}),
//     );

//     if (response.statusCode == 200) {
//       // Parse new access token and refresh token from the response
//       var data = jsonDecode(response.body);
//       authToken = data['access_token'];

//       // Save new access token and optionally a new refresh token
//       await _tokenStorage.saveAuthTokenToStorage(authToken!);
//       if (data.containsKey('refresh_token')) {
//         await _tokenStorage.saveRefreshTokenToStorage(data['refresh_token']);
//       }
//       return true;
//     } else {
//       //throw Exception('Failed to refresh token');
//       return false;
//     }
//   }
// */
//   // Intercept the response for token expiration handling or other needs
//   Future<http.Response> _interceptResponse(http.Response response) async {
//     if (response.statusCode == 401) {
//       // Handle token expiration logic here, like refreshing the token
//       LoggingService.debug('Unauthorized! Trying to refresh token...');
//       // await _refreshToken();  // Optionally call a function to refresh token
//       // Retry logic can be placed here if needed
//     }
//     return response;
//   }

//   // General GET request with interceptors
//   Future<http.Response> getRequest(String endpoint,
//       {Map<String, String>? headers}) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(endpoint, "getRequest");
//       headers = await _addHeaders(headers);
//       final response = await http
//           .get(Uri.parse(_baseUrl + endpoint), headers: headers)
//           .timeout(_timeout);
//       _logRequest(endpoint, response);
//       return _processResponse(await _interceptResponse(response));
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       throw Exception('Error performing GET request: $e');
//     }
//   }
// // Function to intercept and modify requests (e.g., adding authorization headers)

//   Future<String> submitFormData({
//     required String endpoint,
//     required Map<String, String> formData,
//     File? singleFile,
//     File? videoFile,
//     List<File>? listFiles,
//     String singleFileField = 'CompLogo',
//     String listFilesField = 'CompAttachment',
//     String videoFileField = 'video',
//   }) async {
//     issuccess = false;
//     _logRequestprfix(endpoint, "getRequest");
//     if (singleFile == null && (listFiles == null || listFiles.isEmpty)) {
//       return "Please select a file and/or Files";
//     }

//     try {
//       _baseUrl = AppLink.baseUrl;
//       _logRequestprfix(endpoint, "postRequest");

//       var request =
//           http.MultipartRequest('POST', Uri.parse(_baseUrl + endpoint));
//       if (authToken != null) {
//         request.headers['Authorization'] = 'Bearer $authToken';
//       }
//       // Add form fields from the provided Map
//       formData.forEach((key, value) {
//         request.fields[key] = value;
//       });

//       // Add the company logo (if available)
//       if (singleFile != null) {
//         request.files.add(await http.MultipartFile.fromPath(
//           singleFileField,
//           singleFile.path,
//           filename: basename(singleFile.path),
//         ));
//       }

//       if (videoFile != null) {
//         request.files.add(await http.MultipartFile.fromPath(
//           videoFileField,
//           videoFile.path,
//           filename: basename(videoFile.path),
//         ));
//       }

//       // Add attachments (if available)
//       if (listFiles != null && listFiles.isNotEmpty) {
//         for (var file in listFiles) {
//           request.files.add(await http.MultipartFile.fromPath(
//             listFilesField,
//             file.path,
//             filename: basename(file.path),
//           ));
//         }
//       }

//       // Send the request
//       var response = await request.send();

//       if (response.statusCode == 200) {
//         var responseBody = await response.stream.bytesToString();

//         messages = "Success Data submitted successfully";
//         issuccess = true;
//         LoggingService.debug(responseBody);
//         return responseBody;
//       } else {
//         LoggingService.error("Error Failed to submit data");
//         return "Error Failed to submit data";
//       }
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       return "Error An error occurred: $e";
//     }
//   }

// /*
// sample Call 
// void submitCompanyData() async {
//   Map<String, String> formData = {
//     'bundleid': '1',
//     'adddate': DateTime.now().toIso8601String(),
//     'companyname': 'MyCompany',
//     'countryname': 'Country',
//     'cityname': 'City',
//     'addressdetails': 'Address Details',
//     'contactperson': 'Contact Person',
//     'contactphone': '1234567890',
//     'contactmail': 'test@test.com',
//     'password': 'password123',
//     'ConfirmPassword': 'password123',
//     'postcode': '12345',
//     'showunshow': 'true',
//   };

//   // Call the generic function with required parameters
//   await submitFormData(
//     apiUrl: 'https://your-api-url/api/controller/AddCompany',
//     formData: formData,
//     logoFile: compLogo.value,  // Replace with actual file from your state
//     attachmentFiles: compAttachments,  // Replace with actual list of files
//   );
// }

// */
//   // General POST request with interceptors
//   Future<http.Response> postRequest(String endpoint, Map<String, dynamic> data,
//       {Map<String, String>? headers}) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(endpoint, "postRequest");
//       headers = await _addHeaders(headers);
//       final response = await http
//           .post(Uri.parse(_baseUrl + endpoint),
//               headers: headers, body: jsonEncode(data))
//           .timeout(_timeout);
//       _logRequest(endpoint, response);
//       return _processResponse(await _interceptResponse(response));
//     } catch (e, stacktrace) {
//       LoggingService.error("Eror http postRequest", e, stacktrace);
//       throw Exception('Error performing POST request: $e');
//     }
//   }

//   // General PUT request with interceptors
//   Future<http.Response> putRequest(String endpoint, Map<String, dynamic> data,
//       {Map<String, String>? headers}) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(endpoint, "putRequest");
//       headers = await _addHeaders(headers);
//       final response = await http
//           .put(Uri.parse(_baseUrl + endpoint),
//               headers: headers, body: jsonEncode(data))
//           .timeout(_timeout);
//       _logRequest(endpoint, response);
//       return _processResponse(await _interceptResponse(response));
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       throw Exception('Error performing PUT request: $e');
//     }
//   }

//   // General DELETE request with interceptors
//   Future<http.Response> deleteRequest(String endpoint,
//       {Map<String, String>? headers}) async {
//     _baseUrl = AppLink.baseUrl;
//     try {
//       _logRequestprfix(endpoint, "deleteRequest");
//       headers = await _addHeaders(headers);
//       final response = await http
//           .delete(Uri.parse(_baseUrl + endpoint), headers: headers)
//           .timeout(_timeout);
//       _logRequest(endpoint, response);
//       return _processResponse(await _interceptResponse(response));
//     } catch (e, stacktrace) {
//       LoggingService.error("Error fetching data", e, stacktrace);
//       throw Exception('Error performing DELETE request: $e');
//     }
//   }

//   // Handling the API response
//   Future<http.Response> _processResponse(http.Response response) async {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         return response;
//       case 400:
//         issuccess = false;
//         final Map<String, dynamic> responseBody = jsonDecode(response.body);

//         if (responseBody.containsKey('errors')) {
//           // Extract the validation errors
//           validationErrors = responseBody['errors'] as Map<String, dynamic>;

//           // Log or handle validation errors here
//           validationErrors.forEach((field, errorMessages) {
//             errorList = List<String>.from(errorMessages);
//             for (var message in errorList) {
//               LoggingService.debug('$field: $message');
//             }
//           });

//           messages = ValidationErrorException(validationErrors).toString();

//           Get.snackbar(
//             duration: const Duration(seconds: 20),
//             "Error",
//             "An error occurred: $messages",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//           );

//           // You can throw a custom exception here to handle in the UI
//           throw ValidationErrorException(validationErrors);
//         } else {
//           // Handle other 400 errors without validation errors
//           throw Exception('Bad Request: ${response.body}');
//         }

//       case 401:
//         issuccess = false;
//         //   await _refreshToken();
//         //retry send after login
//         throw Exception('Unauthorized: ${response.body}');
//       case 500:
//       default:
//         throw Exception('Server error: ${response.statusCode}');
//     }
//   }
// }

// /*
// 3. Explanation of the Code:

//     _baseUrl: This is the base URL for your API (replace https://api.example.com with your actual base URL).
//     getRequest(): A method that performs a GET request. It takes the endpoint as an argument and optionally accepts headers.
//     postRequest(): A method for POST requests that sends data in JSON format to the API.
//     putRequest(): Similar to the POST request, but used for updating existing data.
//     deleteRequest(): Used for deleting data from the server.
//     _processResponse(): This helper method processes the HTTP response based on the status code and returns a parsed JSON object or throws an error.
//     _timeout: Timeout for HTTP requests (set to 30 seconds by default).
    
//     3. Explanation of Additions:
//     _addHeaders(): This function intercepts each request to add common headers (e.g., authorization token). You can add any headers you need, like Content-Type or Authorization.
//     _logRequest(): This optional function logs the request endpoint and the response for debugging purposes.
//     _interceptResponse(): This function handles the response and performs actions based on the status code. For example, it checks if the status code is 401 (Unauthorized) and performs some token refresh logic. This is where you can add retry mechanisms or token refresh logic if authentication fails.

// */
