import 'package:mubasher_app/features/auth/data_helper/validate.dart';
import 'package:mubasher_app/core/route/routes.dart';
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
    emit(state.copyWith(isShowPasswrd: !state.isShowPasswrd));
  }

  void login(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, PageRouteName.homeRoute);
    }
  }

  void signUp(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, PageRouteName.activateRoute);
    }
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
