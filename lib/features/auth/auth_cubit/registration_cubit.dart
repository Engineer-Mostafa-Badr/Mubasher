import 'package:mubasher_app/features/auth/data_helper/validate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> with Validate {
  RegistrationCubit()
    : super(
        RegistrationState(
          nameController: TextEditingController(),
          emailController: TextEditingController(),
          phoneController: TextEditingController(),
          whatsAppController: TextEditingController(),
          passwordController: TextEditingController(),
          formKey: GlobalKey<FormState>(),
        ),
      );

  void showHidePassword() {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  void updatePhoneCode(String code, String flag) {
    emit(state.copyWith(selectedPhoneCode: code, selectedPhoneFlag: flag));
  }

  void updateWhatsAppCode(String code, String flag) {
    emit(
      state.copyWith(selectedWhatsAppCode: code, selectedWhatsAppFlag: flag),
    );
  }

  @override
  Future<void> close() {
    state.nameController.dispose();
    state.emailController.dispose();
    state.phoneController.dispose();
    state.whatsAppController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
