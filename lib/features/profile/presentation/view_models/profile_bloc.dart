// ignore_for_file: avoid_print
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:mubasher_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_event.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_state.dart';
import 'package:mubasher_app/core/helpers/user_preferences_helper.dart';
import 'package:mubasher_app/features/auth/data/models/user_model.dart';
import 'dart:developer';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ChangePasswordUseCase changePasswordUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc(this.changePasswordUseCase, this.updateProfileUseCase)
    : super(ProfileInitial()) {
    on<SubmitChangePasswordEvent>(_onSubmit);
    on<LoadSavedUserProfile>(_onLoadSavedUserProfile);
    on<SubmitUpdateUserProfileEvent>(_onUpdateUserProfile);
  }

  Future<void> _onSubmit(
    SubmitChangePasswordEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ChangePasswordLoading());

    final result = await changePasswordUseCase(
      ChangePasswordParams(
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
        confirmPassword: event.confirmPassword,
      ),
    );
    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.type)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }

  Future<void> _onLoadSavedUserProfile(
    LoadSavedUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    try {
      final userJson = await UserPreferencesHelper.getUser();
      log('Loaded user JSON: $userJson');

      if (userJson != null) {
        final user = UserModel.fromJson(userJson);
        print('👤 User loaded: ${user.userName}');
        emit(ProfileLoaded(user));
      } else {
        emit(const ProfileLoadFailure('لم يتم العثور على بيانات المستخدم.'));
      }
    } catch (e) {
      emit(ProfileLoadFailure('حدث خطأ أثناء تحميل بيانات المستخدم: $e'));
      log('Error loading user: $e');
    }
  }

  Future<void> _onUpdateUserProfile(
    SubmitUpdateUserProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(UpdateProfileLoading());
    final result = await updateProfileUseCase(event.userData);

    await result.fold(
      (failure) {
        emit(UpdateProfileFailure(failure.type));
      },
      (_) async {
        print('✅ User profile updated successfully');
        print('📤 Updated user data: ${event.userData}');

        final updatedUser = UserModel.fromJson(event.userData);
        await UserPreferencesHelper.saveUserJson(updatedUser.toJson());

        log('💾 User saved to SharedPreferences');
        emit(UpdateProfileSuccess());
      },
    );
  }
}
