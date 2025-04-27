// import 'package:dartz/dartz.dart';
// import '../../../bindings/hoome_binding.dart';
// import '../../../utils/constants.dart';
// import '../../models/common/custorderdetailsalternativeresponsedto_model.dart';
// import '../../providers/api_provider_imp.dart';

// class UserCustOrderDetailsAlternativesRepository {
//   // Dependency injection of ApiServiceImp instance

//   UserCustOrderDetailsAlternativesRepository();

//   final ApiServiceImp _apiService = getControllerLazyPut<ApiServiceImp>();
//   // Method to fetch alternatives data
//   Future<Either<StatusRequest, CustOrderDetailsAlternativeResponseDTO>>
//       fetchAlternativesData(String orderId) async {
//     String url =
//         "${AppLink.userCustOrderDetailsAlternativesSearchData}?fieldname=orderId&fieldvalue=$orderId&ordertype=desc&page=1&limit=1000";
//     final result = await _apiService.getRequest(url);
//     return result.fold(
//       (status) {
//         // Log the error and return a Left with the status
//         return Left(status);
//       },
//       (responseBody) {
//         CustOrderDetailsAlternativeResponseDTO model =
//             CustOrderDetailsAlternativeResponseDTO.fromJson(responseBody);
//         // On success, return Right with the response model
//         return Right(model);
//       },
//     );
//   }

//   // Method to submit user selections
// /*  Future<Either<StatusRequest, dynamic>> submitSelections(List<int> quantities, List<String> notes) async {
//     final data = {
//       'quantities': quantities,
//       'notes': notes,
//     };
//     final result = await apiService.postRequest(AppLink.submitUserSelections, data);
//     return result.fold(
//           (status) => Left(status),
//           (responseBody) => Right(responseBody),
//     );
//   }*/
// }
