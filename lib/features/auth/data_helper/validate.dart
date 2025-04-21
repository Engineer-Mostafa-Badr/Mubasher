import 'package:mubasher_app/core/extension/context.dart';
import 'package:flutter/material.dart';

mixin Validate {
  String? validateEmail({
    required String? email,
    required BuildContext context,
  }) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (email?.isEmpty ?? true) {
      return context.lang.emty(context.lang.email);
    } else if (!emailRegex.hasMatch(email!)) {
      return context.lang.emailFormat;
    }
    return null;
  }

  String? validatePassword({
    required String? password,
    required BuildContext context,
  }) {
    RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (password?.isEmpty ?? true) {
      return context.lang.emty(context.lang.email);
    } else if (!passwordRegExp.hasMatch(password!)) {
      return context.lang.passwordFormat;
    }
    return null;
  }
}
