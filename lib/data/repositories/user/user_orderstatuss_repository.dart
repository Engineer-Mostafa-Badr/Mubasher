// import 'package:dartz/dartz.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/custorderchangestatus_model.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/custorderresponsedto_model.dart';

// import 'package:wrshaonline/app/warsha/data/providers/api_provider_imp.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/shared_preferences_service.dart';
// import 'package:wrshaonline/app/warsha/utils/constants.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';
// import 'package:wrshaonline/app/warsha/bindings/hoome_binding.dart';

// //import 'package:wrshaonline/app/warsha/routes/app_routes.dart';
// class UserOrderStatussRepository {
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();

//   Future<Either<StatusRequest, CustOrderResponseDTO>> userCancelOrderpost(
//     CustOrderChangeStatus orderstatus,
//   ) async {
//     // Define the form data with orderId as a required field
//     //final Map<String, String> formData = {'orderId': orderId};

//     // Call the API service to send the cancel order request with form data
//     final result = await _apiService.postRequest(
//       AppLink.userOrderStatussUserCancelOrder,
//       orderstatus.toJson(),
//     );

//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(status); // Returns Left with the StatusRequest type
//       },
//       (responseBody) {
//         // Parse the response body to the CustOrderResponseDTO model
//         CustOrderResponseDTO model = CustOrderResponseDTO.fromJson(
//           responseBody,
//         );

//         // On success, log the details and return Right with the model
//         LoggingService.debug('OrderStatuss: ${model.generalData}');
//         return Right(model); // Returns Right with the CustOrderResponseDTO type
//       },
//     );
//   }

//   /*  Future<Either<StatusRequest, OrderStatuss>> user_Check_Order_Prices_post() async {
//     // Call the API service to fetch the OrderStatuss
//     final result = await _apiService.postRequest(AppLink.userOrderStatussUserCheckOrderPrices);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         OrderStatuss model = OrderStatuss.fromJson(responseBody);
//         // On success, print the OrderStatuss details and return Right with the user
//         LoggingService.debug('OrderStatuss: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   /*  Future<Either<StatusRequest, OrderStatuss>> user_Accept_Order_Price_Change_post() async {
//     // Call the API service to fetch the OrderStatuss
//     final result = await _apiService.postRequest(AppLink.userOrderStatussUserAcceptOrderPriceChange);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         OrderStatuss model = OrderStatuss.fromJson(responseBody);
//         // On success, print the OrderStatuss details and return Right with the user
//         LoggingService.debug('OrderStatuss: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   /*  Future<Either<StatusRequest, OrderStatuss>> user_Reject_Order_Price_Change_post() async {
//     // Call the API service to fetch the OrderStatuss
//     final result = await _apiService.postRequest(AppLink.userOrderStatussUserRejectOrderPriceChange);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         OrderStatuss model = OrderStatuss.fromJson(responseBody);
//         // On success, print the OrderStatuss details and return Right with the user
//         LoggingService.debug('OrderStatuss: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   /*  Future<Either<StatusRequest, OrderStatuss>> user_Order_Delivered_post() async {
//     // Call the API service to fetch the OrderStatuss
//     final result = await _apiService.postRequest(AppLink.userOrderStatussUserOrderDelivered);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         OrderStatuss model = OrderStatuss.fromJson(responseBody);
//         // On success, print the OrderStatuss details and return Right with the user
//         LoggingService.debug('OrderStatuss: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   /*  Future<Either<StatusRequest, OrderStatuss>> order_Payed_post() async {
//     // Call the API service to fetch the OrderStatuss
//     final result = await _apiService.postRequest(AppLink.userOrderStatussOrderPayed);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         OrderStatuss model = OrderStatuss.fromJson(responseBody);
//         // On success, print the OrderStatuss details and return Right with the user
//         LoggingService.debug('OrderStatuss: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */
// }
