// //import 'package:wrshaonline/app/warsha/routes/app_routes.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mubasher_app/data/providers/api_provider_imp.dart';

// class UserNotificationsRepository {
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();

//   Future<Either<StatusRequest, NotificationResponseDTO>> fetchnotifications(
//       int notifyId, int orderId, int userid, int productId) async {
//     final response = await _apiService.getRequest(
//         "${AppLink.userNotificationsNotificationGetList}?NotifyId=$notifyId&OrderId=$orderId&ProductId=$productId&compId=0&adminid=0&userid=$userid&newRequest=false&webSiteAdmin=false&IsConfirmMessage=false&orderby=id&ordertype=desc"); // Replace with actual endpoint

//     return response.fold(
//       (status) {
//         return Left(status); // Return status on error
//       },
//       (responseBody) {
//         // Parse JSON response into List<CustOrderResponseDTO>
//         NotificationResponseDTO notificationResponse =
//             NotificationResponseDTO.fromJson(responseBody);
//         LoggingService.debug(
//             'Fetched products: ${notificationResponse.datac?.length}');
//         return Right(notificationResponse); // Return the parsed list of orders
//       },
//     );
//   }

// /*  Future<Either<StatusRequest, Notifications>> searchData_get( String fieldname, String fieldvalue, String search, String orderby, String ordertype, String page, String limit) async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.getRequest(AppLink.userNotificationsSearchData);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, Notifications>> indexAll_get( String PageNumber, String PageSize) async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.getRequest(AppLink.userNotificationsIndexAll);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, Notifications>> getByID_get( String id) async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.getRequest(AppLink.userNotificationsGetByID);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, Notifications>> add_post() async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.postRequest(AppLink.userNotificationsAdd);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, Notifications>> edit_post( String id) async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.postRequest(AppLink.userNotificationsEdit);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, Notifications>> delete_delete( String id) async {
//     // Call the API service to fetch the Notifications
//     final result = await _apiService.deleteRequest(AppLink.userNotificationsDelete);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         Notifications model = Notifications.fromJson(responseBody);
//         // On success, print the Notifications details and return Right with the user
//         LoggingService.debug('Notifications: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */
// }
