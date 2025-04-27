// import 'package:dartz/dartz.dart';
// import 'package:wrshaonline/app/warsha/data/models/common/tempcart_model.dart';

// import 'package:wrshaonline/app/warsha/data/models/common/tempcartresponsedto_model.dart';
// import 'package:wrshaonline/app/warsha/data/providers/api_provider_imp.dart';
// import 'package:wrshaonline/app/warsha/data/common_call.dart';

// class TempCartsRepository {
//   // Create an instance of ApiServiceImp
//   //final _apiService = ApiServiceImpT(true); // true if using Dio
//   final ApiServiceImp _apiService = getmyController<ApiServiceImp>();
//   Future<Either<StatusRequest, TempCartResponseDTO>> searchDataGet(
//       String fieldname,
//       String fieldvalue,
//       String search,
//       String orderby,
//       String ordertype,
//       String page,
//       String limiat) async {
//     // Call the API service to fetch the TempCarts
//     String url =
//         "${AppLink.userTempCartsSearchData}?fieldname=$fieldname&fieldvalue=$fieldvalue&ordertype=desc&page=1&limit=1000";
//     final result = await _apiService.getRequest(url);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         //LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, TempCartResponseDTO>> fillCartPost(
//       //String userId, String compId,
//       String cartID) async {
//     // Call the API service to fetch the TempCarts
//     String url = "${AppLink.userTempCartsFillCart}?CartID=$cartID";
//     final result = await _apiService.getRequest(url);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         //LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   /*Future<Either<StatusRequest, TempCartResponseDTO>> indexAllget( String PageNumber, String PageSize) async {
//     // Call the API service to fetch the TempCarts
//     final result = await _apiService.getRequest(AppLink.userTempCartsIndexAll);
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCarts model = TempCarts.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   } */

//   Future<Either<StatusRequest, TempCartResponseDTO>> getByIDget(
//       String id) async {
//     // Call the API service to fetch the TempCarts
//     final result = await _apiService.getRequest(
//         AppLink.userTempCartsGetByID.replaceAll("{id}", id.toString()));
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         // LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, TempCartResponseDTO>> addpost(
//       TempCart tempcart) async {
//     // Call the API service to fetch the TempCarts
//     final result = await _apiService.postRequest(AppLink.userTempCartsAdd, {
//       "cartid": tempcart.cartId,
//       "productid": tempcart.productId,
//       "proquantity": tempcart.proQuantity,
//       "proamount": tempcart.proAmount,
//       "prounitprice": tempcart.proUnitPrice,
//       "regcurr": tempcart.regCurr,
//       "pronotes": tempcart.proNotes,
//       "regcurrar": tempcart.regCurrAr,
//       "egpProUnitPrice": tempcart.egpProUnitPrice,
//       "egpProAmount": tempcart.egpProAmount,
//       "egpRegCurr": tempcart.egpRegCurr,
//       "egpRegCurrAr": tempcart.egpRegCurrAr
//     });
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         // LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, TempCartResponseDTO>> editpost(
//       String id, TempCart tempcart) async {
//     // Call the API service to fetch the TempCarts
//     final result = await _apiService.postRequest(
//         AppLink.userTempCartsEdit.replaceAll("{id}", id.toString()), {
//       "id": tempcart.id,
//       "cartid": tempcart.cartId,
//       "productid": tempcart.productId,
//       "proquantity": tempcart.proQuantity,
//       "proamount": tempcart.proAmount,
//       "prounitprice": tempcart.proUnitPrice,
//       "regcurr": tempcart.regCurr,
//       "pronotes": tempcart.proNotes,
//       "regcurrar": tempcart.regCurrAr,
//       "egpProUnitPrice": tempcart.egpProUnitPrice,
//       "egpProAmount": tempcart.egpProAmount,
//       "egpRegCurr": tempcart.egpRegCurr,
//       "egpRegCurrAr": tempcart.egpRegCurrAr
//     });
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         // LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }

//   Future<Either<StatusRequest, TempCartResponseDTO>> deleteCart(
//       String id) async {
//     // Call the API service to fetch the TempCarts
//     final result = await _apiService.deleteRequest(
//         AppLink.userTempCartsDelete.replaceAll("{id}", id.toString()));
//     // Process the result using fold
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         LoggingService.debug('Error: $status');
//         return Left(
//             status); // This returns the Left with the StatusRequest type
//       },
//       (responseBody) {
//         TempCartResponseDTO model = TempCartResponseDTO.fromJson(responseBody);
//         // On success, print the TempCarts details and return Right with the user
//         // LoggingService.debug('TempCarts: ${model.name}');
//         return Right(model); // This returns the Right with the User type
//       },
//     );
//   }
// }
