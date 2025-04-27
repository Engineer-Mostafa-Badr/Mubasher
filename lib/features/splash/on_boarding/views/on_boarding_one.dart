import 'package:mubasher_app/features/auth/widgets/components/auth_export_file.dart';
import 'package:mubasher_app/features/splash/on_boarding/widgets/custom_onboarding_views.dart';

class OnboardingOneView extends StatelessWidget {
  const OnboardingOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingViews(
      onPressed: () {
        Navigator.pushNamed(context, PageRouteName.onBoardingTwoRoute);
      },
      isOnboardingOne: true,
      titleTextOne: context.lang.findText,
      titleTextTwo: context.lang.bistPlaseText,
      titleTextThree: context.lang.toStayInText,
      titleTextFour: context.lang.goodPriceText,
      bodyPicture: AssetsManager.onBoarding1,
    );
  }
}
