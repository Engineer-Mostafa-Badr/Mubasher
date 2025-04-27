import 'package:mubasher_app/features/splash/on_boarding/widgets/custom_onboarding_views.dart';
import 'package:mubasher_app/features/auth/widgets/components/auth_export_file.dart';

class OnboardingThreeView extends StatelessWidget {
  const OnboardingThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingViews(
      onPressed: () {
        Navigator.pushNamed(context, PageRouteName.signInRoute);
      },
      isOnboardingThree: true,
      titleTextOne: context.lang.findText,
      titleTextTwo: context.lang.perfectChoiceText,
      colorTextTwo: ColorManager.primaryColor,
      titleTextThree: context.lang.yourFutureHouseText,
      bodyPicture: AssetsManager.onBoarding3,
    );
  }
}
