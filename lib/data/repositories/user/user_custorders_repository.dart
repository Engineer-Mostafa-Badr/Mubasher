// import 'package:dartz/dartz.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/custordersadddto_model.dart';
// import 'package:wrshaonline/app/warsha/data/providers/api_provider_imp.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/shared_preferences_service.dart';
// import 'package:wrshaonline/app/warsha/utils/constants.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';
// import 'package:wrshaonline/app/warsha/bindings/hoome_binding.dart';

// import '../../models/common/custorderresponsedto_model.dart';

// //import 'package:wrshaonline/app/warsha/routes/app_routes.dart';
// class UserCustOrdersRepository {
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();
//   Future<Either<StatusRequest, CustOrderResponseDTO>> fetchOrders(
//       int userID) async {
//     final response = await _apiService.getRequest(
//         "${AppLink.userCustOrdersgetUserCustOrder}?userID=$userID&orderby=id&ordertype=desc&page=1&limit=100"); // Replace with actual endpoint

//     return response.fold(
//       (status) {
//         return Left(status); // Return status on error
//       },
//       (responseBody) {
//         // Parse JSON response into List<CustOrderResponseDTO>
//         CustOrderResponseDTO ordersResponse =
//             CustOrderResponseDTO.fromJson(responseBody);
//         LoggingService.debug(
//             'Fetched products: ${ordersResponse.datac?.length}');
//         return Right(ordersResponse); // Return the parsed list of orders
//       },
//     );
//   }
//   /* Future<Either<StatusRequest, CustOrderResponseDTO>> searchData_get( String fieldname, String fieldvalue, String search, String orderby, String ordertype, String page, String limit) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.getRequest(AppLink.userCustOrdersSearchData);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrderResponseDTO model = CustOrderResponseDTO.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         LoggingService.debug('CustOrders: ${model.datac}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, CustOrders>> indexAll_get( String PageNumber, String PageSize) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.getRequest(AppLink.userCustOrdersIndexAll);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrders model = CustOrders.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         LoggingService.debug('CustOrders: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   Future<Either<StatusRequest, CustOrderResponseDTO>> getByID(String id) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.getRequest(AppLink.userCustOrdersGetByID);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrderResponseDTO model =
//             CustOrderResponseDTO.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         //LoggingService.debug('CustOrders: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, CustOrderResponseDTO>> add(
//       CustordersAddDTO custorder) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.postRequest(
//         AppLink.userCustOrdersAdd, custorder.toJson());
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrderResponseDTO model =
//             CustOrderResponseDTO.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         //LoggingService.debug('CustOrders: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, CustOrderResponseDTO>> placeOrder(
//       CustordersAddDTO custorder, bool isarabic) async {
//     try {
//       // تكوين الرابط
//       String url = '${AppLink.userCustOrdersPlaceOrder}/$isarabic';
//       LoggingService.debug('Request URL: $url');
//       LoggingService.debug('Request Body: ${custorder.toJson()}');

//       // إرسال الطلب
//       var result = await _apiService.postRequest(url, custorder.toJson());

//       // معالجة الاستجابة باستخدام fold
//       return result.fold(
//         (status) {
//           LoggingService.error('Request failed with status: $status');
//           return Left(status);
//         },
//         (responseBody) {
//           LoggingService.debug('Response Body: $responseBody');
//           CustOrderResponseDTO model =
//               CustOrderResponseDTO.fromJson(responseBody);
//           return Right(model);
//         },
//       );
//     } catch (e) {
//       LoggingService.error('Exception occurred: $e');
//       return const Left(
//           StatusRequest.serverError); // أو أي نوع مناسب لحالة الخطأ
//     }
//   }

// /*  Future<Either<StatusRequest, CustOrders>> edit_post( String id) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.postRequest(AppLink.userCustOrdersEdit);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrders model = CustOrders.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         LoggingService.debug('CustOrders: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, CustOrders>> delete_delete( String id) async {
//     // Call the API service to fetch the CustOrders
//     final result = await _apiService.deleteRequest(AppLink.userCustOrdersDelete);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         CustOrders model = CustOrders.fromJson(responseBody);
//         // On success, print the CustOrders details and return Right with the user
//         LoggingService.debug('CustOrders: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */
// }
