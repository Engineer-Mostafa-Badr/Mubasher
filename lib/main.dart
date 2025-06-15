// ignore_for_file: avoid_print
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_event.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_bloc.dart';
import 'package:mubasher_app/features/profile/profile_cubit/change_password_cubit.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/user_preferences_helper.dart';
import 'package:mubasher_app/features/auth/data/models/user_model.dart';
import 'package:mubasher_app/core/helpers/language_storage_helper.dart';
import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import 'package:mubasher_app/config/lang/app_localizations.dart';
import 'package:mubasher_app/core/route/routes_generator.dart';
import 'config/app_controller/cubit/app_controller_cubit.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';
import 'package:mubasher_app/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  AppNotifier.configLoading();
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

  UserModel? savedUser;
  try {
    final savedUserMap = await UserPreferencesHelper.getUser();
    if (savedUserMap != null) {
      savedUser = UserModel.fromJson(savedUserMap);
      print('🙋‍♂️ Saved user loaded: ${savedUser.email}');
    } else {
      print('ℹ️ No saved user found');
    }
  } catch (e) {
    print('❌ Error loading saved user: $e');
  }
  final appLangLocale = Locale(savedLang ?? 'en');
  final appControllerCubit =
      AppControllerCubit()..updateLanguage(appLangLocale);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) {
            final bloc = AuthBloc(
              loginUseCase: getIt(),
              registerUseCase: getIt(),
              activateAccountUseCase: getIt(),
              authRepository: getIt(),
            );
            if (savedUser != null) {
              bloc.add(LoadSavedUserEvent(savedUser));
            }
            return bloc;
          },
        ),

        BlocProvider<AppControllerCubit>.value(value: appControllerCubit),
        BlocProvider(create: (_) => RegistrationCubit()),
        BlocProvider(create: (_) => ChangePasswordCubit()),
        BlocProvider(
          create: (_) => getIt<ProfileBloc>()..add(LoadSavedUserProfile()),
        ),
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
