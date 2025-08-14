// ignore_for_file: avoid_print
import 'package:mubasher_app/core/helpers/language_storage_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'app_controller_state.dart';

class AppControllerCubit extends Cubit<AppControllerState> {
  AppControllerCubit() : super(const AppControllerState()) {
    _loadInitialLanguage();
  }

  void _loadInitialLanguage() async {
    final savedLangCode = await LanguageStorageHelper.getLang();
    final newLocale = Locale(savedLangCode ?? 'en');
    emit(AppControllerState(appLang: newLocale, appTheme: state.appTheme));
    print('🚀 Initial language loaded: ${newLocale.languageCode}');
  }

  void changeLang(Locale newLang) {
    emit((state.copyWith(appLang: newLang)));
    LanguageStorageHelper.saveLang(newLang.languageCode);
  }

  void changeTheme(Brightness newTheme) {
    emit((state.copyWith(appTheme: newTheme)));
  }

  void changeAppLang(String langCode) {
    final newLocale = Locale(langCode);
    emit(AppControllerState(appLang: newLocale, appTheme: state.appTheme));
    LanguageStorageHelper.saveLang(langCode);
    print('✅ Language changed to: $langCode');
  }

  void updateLanguage(Locale locale) {
    emit(state.copyWith(appLang: locale));
  }
}
