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
      return context.lang.emailFormatText;
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
      return context.lang.emty(context.lang.password);
    } else if (!passwordRegExp.hasMatch(password!)) {
      return context.lang.passwordFormatText;
    }
    return null;
  }

  String? validateName({required String? name, required BuildContext context}) {
    if (name?.isEmpty ?? true) {
      return context.lang.emty(context.lang.fullNameText);
    } else if (name!.length < 3) {
      return context.lang.nameFormatText;
    }
    return null;
  }

  String? validatePhoneNumber({
    required String? phoneNumber,
    required BuildContext context,
  }) {
    RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (phoneNumber?.isEmpty ?? true) {
      return context.lang.emty(context.lang.phoneNumberText);
    } else if (!phoneRegex.hasMatch(phoneNumber!)) {
      return context.lang.phoneNumberFormatText;
    }
    return null;
  }

  String? validateWhatsApp({
    required String? whatsAppNumber,
    required BuildContext context,
  }) {
    RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (whatsAppNumber?.isEmpty ?? true) {
      return context.lang.emty(context.lang.whatsAppText);
    } else if (!phoneRegex.hasMatch(whatsAppNumber!)) {
      return context.lang.whatsAppFormatText;
    }
    return null;
  }
}
