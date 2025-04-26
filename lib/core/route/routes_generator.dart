import 'package:mubasher_app/features/profile/views/edit_profile.dart';
import 'package:mubasher_app/features/profile/views/profile_options.dart';
import 'package:mubasher_app/features/splash/on_boarding/views/on_boarding_three.dart';
import 'package:mubasher_app/features/splash/on_boarding/views/on_boarding_two.dart';
import 'package:mubasher_app/features/auth/active_account/views/enter_otp_view.dart';
import 'package:mubasher_app/features/splash/on_boarding/views/on_boarding_one.dart';
import 'package:mubasher_app/features/auth/active_account/views/activate_view.dart';
import 'package:mubasher_app/features/profile/views/profile_view.dart';
import 'package:mubasher_app/features/splash/views/splash_view.dart';
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
      case PageRouteName.onBoardingOneRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingOneView(),
          settings: settings,
        );
      case PageRouteName.onBoardingTwoRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingTwoView(),
          settings: settings,
        );
      case PageRouteName.onBoardingThreeRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingThreeView(),
          settings: settings,
        );
      case PageRouteName.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
          settings: settings,
        );
      case PageRouteName.editProfileRoute:
        return MaterialPageRoute(
          builder: (context) => const EditProfileView(),
          settings: settings,
        );
      case PageRouteName.profileOptionsRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileOptionsView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
