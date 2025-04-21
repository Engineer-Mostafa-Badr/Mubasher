part of 'app_controller_cubit.dart';

class AppControllerState extends Equatable {
  const AppControllerState({
    this.appLang = const Locale('en'),
    this.appTheme = Brightness.light,
  });

  final Locale appLang;
  final Brightness appTheme;

  AppControllerState copyWith({Brightness? appTheme, Locale? appLang}) =>
      AppControllerState(
        appLang: appLang ?? this.appLang,
        appTheme: appTheme ?? this.appTheme,
      );

  @override
  List<Object> get props => [appLang, appTheme];
}
