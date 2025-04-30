import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomOnboardingViews extends StatelessWidget {
  const CustomOnboardingViews({
    super.key,
    this.onPressed,
    this.bodyPicture,
    this.titleTextOne,
    this.titleTextTwo,
    this.titleTextThree,
    this.titleTextFour,
    this.colorTextTwo,
    this.colorTextFour,
    this.isOnboardingThree = false,
    this.isOnboardingOne = false,
  });

  final Function()? onPressed;
  final String? bodyPicture;
  final String? titleTextOne;
  final String? titleTextTwo;
  final String? titleTextThree;
  final String? titleTextFour;
  final Color? colorTextTwo;
  final Color? colorTextFour;
  final bool isOnboardingThree;
  final bool isOnboardingOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        SvgImagesManager.group21,
                        height: 51.px,
                        width: 87.px,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PageRouteName.signInRoute,
                          );
                        },
                        child: SvgPicture.asset(
                          SvgImagesManager.skipButton,
                          height: 38.px,
                          width: 86.px,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  TextSpanManager(
                    textOne: titleTextOne ?? '',
                    fontSizeTextOne: 25.px,
                    fontWeightTextOne: FontWeight.w500,
                    colorTextOne: ColorManager.black,
                    latterSpaceTextOne: 0.5,
                    fontFamilyTextOne: "Lato",
                    textTwo:
                        isOnboardingThree
                            ? '${titleTextTwo!} ${context.lang.forText}'
                            : titleTextTwo ?? '',
                    fontSizeTextTwo: 25.px,
                    fontWeightTextTwo: FontWeight.w600,
                    colorTextTwo: colorTextTwo ?? ColorManager.black,
                    fontFamilyTextTwo: "Lato",
                    latterSpaceTextTwo: 0.5,
                  ),
                  SizedBox(height: 0.5.h),
                  TextSpanManager(
                    textOne: titleTextThree ?? '',
                    fontSizeTextOne: 25.px,
                    fontWeightTextOne: FontWeight.w500,
                    colorTextOne: ColorManager.black,
                    latterSpaceTextOne: 0.5,
                    fontFamilyTextOne: "Lato",
                    textTwo: titleTextFour ?? '',
                    fontSizeTextTwo: 25.px,
                    fontWeightTextTwo: FontWeight.w700,
                    colorTextTwo: colorTextFour ?? ColorManager.primaryColor,
                    fontFamilyTextTwo: "Lato",
                    latterSpaceTextTwo: 0.5,
                  ),
                  SizedBox(height: 2.h),
                  AppText(
                    text: context.lang.descriptionBordingViewsText,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.px,
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.w),
                      child: Image.asset(
                        bodyPicture!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 3.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15.w,
                            height: 0.5.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment:
                                isOnboardingOne
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                            children: [
                              if (!isOnboardingOne) ...[
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Container(
                                    height: 48.px,
                                    width: 48.px,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SvgPicture.asset(
                                          SvgImagesManager.arrowLeft,
                                          height: 20.px,
                                          width: 20.px,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                              ],
                              isOnboardingOne
                                  ? Flexible(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorManager.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            3.5.w,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2.5.h,
                                          horizontal: 25.w,
                                        ),
                                      ),
                                      onPressed: onPressed,
                                      child: AppText(
                                        text: context.lang.nextText,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.px,
                                        textColor: ColorManager.white,
                                      ),
                                    ),
                                  )
                                  : Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 16.w),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              3.5.w,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2.5.h,
                                          ),
                                        ),
                                        onPressed: onPressed,
                                        child: AppText(
                                          text: context.lang.nextText,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17.px,
                                          textColor: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
