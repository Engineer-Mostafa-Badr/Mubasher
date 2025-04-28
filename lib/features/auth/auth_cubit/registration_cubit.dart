import 'package:mubasher_app/features/auth/data_helper/validate.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> with Validate {
  RegistrationCubit()
    : super(
        RegistrationState(
          formKey: GlobalKey<FormState>(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          nameController: TextEditingController(),
          phoneController: TextEditingController(),
          whatsAppController: TextEditingController(),
          isShowPasswrd: true,
        ),
      );

  void showHidePassword() {
    emit(state.copyWith(isShowPasswrd: !state.isShowPasswrd));
  }

  void login(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, PageRouteName.homeRoute);
      log('Login successful');
    } else {
      log('Login failed');
    }
  }

  void signUp(BuildContext context) {
    if (state.formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, PageRouteName.activateRoute);
      log('Sign up successful');
    } else {
      log('Sign up failed');
    }
  }
}
