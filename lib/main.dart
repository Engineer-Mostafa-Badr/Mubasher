import 'package:mubasher_app/core/route/routes_generator.dart';
import 'config/app_controller/cubit/app_controller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                onGenerateRoute: RoutesGenerator.onGenerateRoutes,
                initialRoute: PageRouteName.splashRoute,
              );
            },
          ),
        );
      },
    );
  }
}
