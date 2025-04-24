import 'package:mubasher_app/features/auth/active_account/views/activate_view.dart';
import 'package:mubasher_app/features/auth/active_account/views/enter_otp_view.dart';
import 'package:mubasher_app/features/splash/splash_view.dart';
import '../../features/auth/sign_in/views/sign_in_view.dart';
import '../../features/auth/sign_up/views/sign_up_view.dart';
import 'package:mubasher_app/core/route/routes.dart';
import '../../features/home/views/home_view.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRouteName.signInRoute:
        return MaterialPageRoute(
          builder: (context) => SignInView(),
          settings: settings,
        );
      case PageRouteName.signUpRoute:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );
      case PageRouteName.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case PageRouteName.activateRoute:
        return MaterialPageRoute(
          builder: (context) => const ActivateView(),
          settings: settings,
        );
      case PageRouteName.enterOTPRoute:
        return MaterialPageRoute(
          builder: (context) => EnterOTPView(),
          settings: settings,
        );
      // case PageRoutesName.productDetailsScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProductDetails(),
      //     settings: settings,
      //   );
      // case PageRoutesName.wishRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProductDetails(),
      //     settings: settings,
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
