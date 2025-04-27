// import 'package:dartz/dartz.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/shared_preferences_service.dart';
// import 'package:wrshaonline/app/warsha/utils/constants.dart';
// //import'package:wrshaonline/app/warsha/data/providers/local_storage/token_storage.dart';
// import 'package:wrshaonline/app/warsha/services/logging_service.dart';

// import '../../../bindings/hoome_binding.dart';
// import '../../models/common/chatdetailresponsedto_model.dart';
// import '../../models/common/chatdetailssimpleadddto_model.dart';
// import '../../models/common/chatmainadddto_model.dart';
// import '../../models/common/chatmainresponsedto_model.dart';
// import '../../providers/api_provider_imp.dart';

// //import 'package:wrshaonline/app/warsha/routes/app_routes.dart';
// class UserChatMainsRepository {
//   // Create an instance of ApiServiceImp;
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();
//   Future<Either<StatusRequest, ChatMainResponseDTO>> userGetOrOpenChatpost(
//       ChatmainAddDTO chatmainadd) async {
//     // Call the API service to fetch the ChatMains
//     final formData = chatmainadd.toJson();
//     final result = await _apiService.postRequest(
//         AppLink.userChatMainsUserGetOrOpenChat, formData);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMainResponseDTO model = ChatMainResponseDTO.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.generalData}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, ChatMainResponseDTO>> userCloseChatpost(
//       String chatId) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.postRequest(
//         AppLink.userChatMainsUserCloseChat.replaceAll('chatId', chatId), {});
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMainResponseDTO model = ChatMainResponseDTO.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.generalData}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, ChatDetailResponseDTO>> userAddChatDetailspost(
//       ChatdetailsSimpleAddDTO chatdetailsAdd) async {
//     final formData = chatdetailsAdd.toJson(); // Convert the DTO to JSON

//     // Call the API service to send the chat details
//     final result = await _apiService.postRequest(
//         AppLink.userChatDetailsAddDetailsUsingChatMainData, formData);

//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(status); // Return the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatDetailResponseDTO model =
//             ChatDetailResponseDTO.fromJson(responseBody);
//         // On success, print the chat details response and return Right with the model
//         LoggingService.debug('Chat Details Added: ${model.generalData}');
//         return Right(model); // Return the Right with the response DTO type
//       },
//     );
//   }

// /*  Future<Either<StatusRequest, ChatMains>> product_Lookup_get( String OrderId) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.getRequest(AppLink.userChatMainsProductLookup);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> searchData_get( String fieldname, String fieldvalue, String search, String orderby, String ordertype, String page, String limit) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.getRequest(AppLink.userChatMainsSearchData);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> indexAll_get( String PageNumber, String PageSize) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.getRequest(AppLink.userChatMainsIndexAll);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> getByID_get( String id) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.getRequest(AppLink.userChatMainsGetByID);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> add_post() async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.postRequest(AppLink.userChatMainsAdd);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> edit_post( String id) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.postRequest(AppLink.userChatMainsEdit);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

// /*  Future<Either<StatusRequest, ChatMains>> delete_delete( String id) async {
//     // Call the API service to fetch the ChatMains
//     final result = await _apiService.deleteRequest(AppLink.userChatMainsDelete);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         ChatMains model = ChatMains.fromJson(responseBody);
//         // On success, print the ChatMains details and return Right with the user
//         LoggingService.debug('ChatMains: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */
// }
