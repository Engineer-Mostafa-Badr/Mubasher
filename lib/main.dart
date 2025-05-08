// ignore_for_file: avoid_print
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
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

  String? token;
  try {
    token = await TokenStorageHelper.getToken();
    print('🔐 Token retrieved: $token');
  } catch (e) {
    print('❌ Error retrieving token: $e');
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (_) => AuthBloc(loginUseCase: getIt(), registerUseCase: getIt()),
        ),
      ],
      child: MubasherApp(
        initialRoute:
            token != null && token.isNotEmpty
                ? PageRouteName.homeRoute
                : PageRouteName.splashRoute,
      ),
    ),
  );
}

class MubasherApp extends StatelessWidget {
  final String initialRoute;
  const MubasherApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocProvider<AppControllerCubit>(
          create: (context) => AppControllerCubit(),
          child: BlocBuilder<AppControllerCubit, AppControllerState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Mubasher App',
                locale: state.appLang,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),
                initialRoute: initialRoute,
                onGenerateRoute: RoutesGenerator.onGenerateRoutes,
                localeResolutionCallback: (locale, supportedLocales) {
                  return locale?.languageCode == 'ar'
                      ? const Locale('ar')
                      : const Locale('en');
                },
                builder: (context, child) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: EasyLoading.init()(context, child),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
