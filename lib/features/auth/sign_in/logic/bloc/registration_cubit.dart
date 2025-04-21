import 'package:mubasher_app/features/auth/data_helper/validate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> with Validate {
  RegistrationCubit()
    : super(
        RegistrationState(
          formKey: GlobalKey<FormState>(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
      );
  void showHidePassword() {
    emit(state.copyWith(isShowPasswrd: !state.isShowPasswrd));
  }

  void login() {
    if (state.formKey.currentState!.validate()) {
      print('Login successful');
    } else {
      print('Login failed');
    }
  }
}
