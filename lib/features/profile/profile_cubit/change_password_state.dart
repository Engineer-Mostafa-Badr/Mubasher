part of 'change_password_cubit.dart';

class ChangePasswordState {
  final bool showOld;
  final bool showNew;
  final bool showConfirm;
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  ChangePasswordState({
    required this.showOld,
    required this.showNew,
    required this.showConfirm,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  ChangePasswordState copyWith({
    bool? showOld,
    bool? showNew,
    bool? showConfirm,
    TextEditingController? oldPasswordController,
    TextEditingController? newPasswordController,
    TextEditingController? confirmPasswordController,
  }) {
    return ChangePasswordState(
      showOld: showOld ?? this.showOld,
      showNew: showNew ?? this.showNew,
      showConfirm: showConfirm ?? this.showConfirm,
      oldPasswordController:
          oldPasswordController ?? this.oldPasswordController,
      newPasswordController:
          newPasswordController ?? this.newPasswordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
    );
  }

  factory ChangePasswordState.initial() {
    return ChangePasswordState(
      showOld: false,
      showNew: false,
      showConfirm: false,
      oldPasswordController: TextEditingController(),
      newPasswordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
    );
  }
}
