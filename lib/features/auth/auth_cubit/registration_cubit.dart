import 'package:mubasher_app/features/auth/data_helper/validate.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
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
          facebookController: TextEditingController(),
          profilePictureController: TextEditingController(),
          documentsController: TextEditingController(),
          countryController: TextEditingController(),
          cityController: TextEditingController(),
          formKey: GlobalKey<FormState>(),
          profileImage: null,
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

  void selectUserType({required bool isSeller}) {
    emit(state.copyWith(isSeller: isSeller, isUser: !isSeller));
  }

  Future<int> getAndroidSdkInt() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt;
    }
    return 0;
  }

  Future<void> pickProfileImage() async {
    final sdkInt = await getAndroidSdkInt();

    PermissionStatus status;
    if (sdkInt >= 33) {
      status = await Permission.photos.request();
    } else {
      status = await Permission.storage.request();
    }

    if (!status.isGranted) {
      log("Permission not granted");
      emit(state.copyWith(isProfileImageValid: false));
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      emit(state.copyWith(profileImage: image, isProfileImageValid: true));
    } else {
      emit(state.copyWith(isProfileImageValid: false));
    }
  }

  @override
  Future<void> close() {
    state.nameController.dispose();
    state.emailController.dispose();
    state.phoneController.dispose();
    state.whatsAppController.dispose();
    state.passwordController.dispose();
    state.facebookController.dispose();
    state.profilePictureController.dispose();
    state.documentsController.dispose();
    state.countryController.dispose();
    state.cityController.dispose();
    return super.close();
  }
}
