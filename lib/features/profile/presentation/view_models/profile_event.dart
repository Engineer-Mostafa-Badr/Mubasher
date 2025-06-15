import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class SubmitChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  const SubmitChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [oldPassword, newPassword, confirmPassword];
}

class LoadSavedUserProfile extends ProfileEvent {
  const LoadSavedUserProfile();
}

class SubmitUpdateUserProfileEvent extends ProfileEvent {
  final Map<String, dynamic> userData;

  const SubmitUpdateUserProfileEvent({required this.userData});
  @override
  List<Object?> get props => [userData];
}
