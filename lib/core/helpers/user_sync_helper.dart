// import 'package:mubasher_app/features/profile/data/models/profile_user_model.dart';
// import 'package:mubasher_app/core/helpers/user_preferences_helper.dart';
// import 'package:mubasher_app/core/helpers/token_storage_helper.dart';

// class UserSyncHelper {
//   /// بعد تعديل بيانات البروفايل، نحولها إلى UserModel مع التوكن الحالي
//   static Future<void> saveProfileAsUser(ProfileUserModel profileUser) async {
//     try {
//       // نحصل على التوكن الحالي من التخزين الآمن
//       final token = await TokenStorageHelper.getToken();

//       if (token == null || token.isEmpty) {
//         print('⚠️ Token not found, cannot sync user data.');
//         return;
//       }

//       // نحول الـ ProfileUserModel إلى UserModel ونضيف له التوكن
//       final updatedUser = profileUser.toUserModel(token);

//       // نحفظ البيانات الجديدةش
//       await UserPreferencesHelper.saveUserJson(updatedUser.toJson());

//       print('✅ Profile synced to user with token.');
//     } catch (e) {
//       print('❌ Failed to sync profile as user: $e');
//     }
//   }
// }
