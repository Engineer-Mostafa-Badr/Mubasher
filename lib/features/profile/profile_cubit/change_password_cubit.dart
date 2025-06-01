import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState.initial());

  void toggleOld() => emit(state.copyWith(showOld: !state.showOld));
  void toggleNew() => emit(state.copyWith(showNew: !state.showNew));
  void toggleConfirm() => emit(state.copyWith(showConfirm: !state.showConfirm));
  void clearFields() {
    state.oldPasswordController.clear();
    state.newPasswordController.clear();
    state.confirmPasswordController.clear();
  }
}
