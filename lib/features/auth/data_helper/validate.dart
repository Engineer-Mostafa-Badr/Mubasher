import 'package:mubasher_app/core/extension/context.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
    RegExp passwordRegExp = RegExp(r'^.{6,}$');
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

  String? validateChooseProfilePicture({
    required File? profileImage,
    required BuildContext context,
  }) {
    if (profileImage == null) {
      return context.lang.profilePictureFormatText;
    }
    return null;
  }

  String? validateFacebook({
    required String? facebook,
    required BuildContext context,
  }) {
    if (facebook?.isEmpty ?? true) {
      return context.lang.emty(context.lang.facebookText);
    } else if (facebook!.length < 3) {
      return context.lang.facebookFormatText;
    }

    final facebookRegex = RegExp(
      r'^(https?:\/\/)?([a-zA-Z0-9-]+\.)?facebook\.com\/[A-Za-z0-9\.]+\/?$',
      caseSensitive: false,
    );

    if (!facebookRegex.hasMatch(facebook)) {
      return context.lang.facebookFormatText;
    }

    return null;
  }

  String? validateDocuments({
    required String? documents,
    required BuildContext context,
  }) {
    if (documents?.trim().isEmpty ?? true) {
      return context.lang.emty(context.lang.documentsText);
    } else if (documents!.trim().length < 3) {
      return context.lang.documentsFormatText;
    }

    final hasLetters = RegExp(r'[a-zA-Zء-ي]').hasMatch(documents);
    if (!hasLetters) {
      return context.lang.documentsFormatText;
    }

    return null;
  }

  String? validateCountry({
    required String? country,
    required BuildContext context,
  }) {
    if (country?.isEmpty ?? true) {
      return context.lang.emty(context.lang.countryText);
    } else if (country!.length < 3) {
      return context.lang.countryFormatText;
    }
    return null;
  }

  String? validateCity({required String? city, required BuildContext context}) {
    if (city?.isEmpty ?? true) {
      return context.lang.emty(context.lang.cityText);
    } else if (city!.length < 3) {
      return context.lang.cityFormatText;
    }
    return null;
  }

  final Map<String, int> expectedLengths = {
    '+20': 10, // مصر
    '+966': 9, // السعودية
    '+971': 9, // الإمارات
    '+965': 8, // الكويت
    '+968': 8, // سلطنة عمان
    '+974': 8, // قطر
    '+973': 8, // البحرين
  };

  String? validatePhoneNumber({
    required String? phoneNumber,
    required String selectedPhoneCode,
    required BuildContext context,
  }) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return context.lang.emty(context.lang.phoneNumberText);
    }

    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');

    if (cleanedNumber.startsWith('0')) {
      cleanedNumber = cleanedNumber.substring(1);
    }

    final expectedLength = expectedLengths[selectedPhoneCode];

    if (expectedLength == null) {
      return context.lang.emty(context.lang.phoneNumberText);
    }

    if (!RegExp(r'^\d+$').hasMatch(cleanedNumber)) {
      return context.lang.phoneNumberFormatText;
    }

    if (cleanedNumber.length != expectedLength) {
      return context.lang.phoneNumberFormatText;
    }

    return null;
  }

  String? validateWhatsApp({
    required String? whatsAppNumber,
    required String selectedPhoneCode,
    required BuildContext context,
  }) {
    if (whatsAppNumber == null || whatsAppNumber.trim().isEmpty) {
      return context.lang.emty(context.lang.whatsAppText);
    }

    String cleanedNumber = whatsAppNumber.replaceAll(RegExp(r'\s+'), '');

    if (cleanedNumber.startsWith('0')) {
      cleanedNumber = cleanedNumber.substring(1);
    }

    final expectedLength = expectedLengths[selectedPhoneCode];

    if (expectedLength == null) {
      return context.lang.emty(context.lang.whatsAppText);
    }

    if (!RegExp(r'^\d+$').hasMatch(cleanedNumber)) {
      return context.lang.whatsAppFormatText;
    }

    if (cleanedNumber.length != expectedLength) {
      return context.lang.whatsAppFormatText;
    }

    return null;
  }
}
