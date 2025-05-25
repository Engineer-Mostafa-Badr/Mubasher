// ignore_for_file: avoid_print
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/language_storage_helper.dart';
import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import 'package:mubasher_app/config/lang/app_localizations.dart';
import 'package:mubasher_app/core/route/routes_generator.dart';
import 'config/app_controller/cubit/app_controller_cubit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubasher_app/core/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  AppNotifier.configLoading();
  // debugPaintSizeEnabled = true;

  String? token;
  String? savedLang;
  try {
    token = await TokenStorageHelper.getToken();
    print('🔐 Token retrieved: $token');
  } catch (e) {
    print('❌ Error retrieving token: $e');
  }

  try {
    savedLang = await LanguageStorageHelper.getLang();
    print('🌍 Saved Language: $savedLang');
  } catch (e) {
    print('❌ Error retrieving language: $e');
  }
  final appLangLocale = Locale(savedLang ?? 'en');
  final appControllerCubit =
      AppControllerCubit()..updateLanguage(appLangLocale);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (_) => AuthBloc(
                loginUseCase: getIt(),
                registerUseCase: getIt(),
                activateAccountUseCase: getIt(),
                authRepository: getIt(),
              ),
        ),
        BlocProvider<AppControllerCubit>.value(value: appControllerCubit),
      ],
      child: const MubasherApp(),
    ),
  );
}

class MubasherApp extends StatelessWidget {
  const MubasherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocBuilder<AppControllerCubit, AppControllerState>(
          builder: (context, state) {
            print('🧭 Current appLang from state: ${state.appLang}');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mubasher App',
              locale: state.appLang,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              initialRoute: PageRouteName.splashRoute,
              onGenerateRoute: RoutesGenerator.onGenerateRoutes,
              localeResolutionCallback: (locale, supportedLocales) {
                return locale?.languageCode == 'ar'
                    ? const Locale('ar')
                    : const Locale('en');
              },
              builder: (context, child) {
                final langCode = Localizations.localeOf(context).languageCode;
                final isArabic = langCode == 'ar';

                return Directionality(
                  textDirection:
                      isArabic ? TextDirection.rtl : TextDirection.ltr,
                  child: EasyLoading.init()(context, child),
                );
              },
            );
          },
        );
      },
    );
  }
}
