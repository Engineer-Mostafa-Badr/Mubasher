import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/splash/on_boarding/widgets/custom_onboarding_views.dart';

class OnboardingTwoView extends StatelessWidget {
  const OnboardingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingViews(
      onPressed: () {
        Navigator.pushNamed(context, PageRouteName.onBoardingThreeRoute);
      },
      titleTextOne: context.lang.fastBuyingYourPropertyText,
      titleTextThree: context.lang.inJustText,
      titleTextFour: context.lang.oneClickText,
      bodyPicture: AssetsManager.onBoarding2,
    );
  }
}
