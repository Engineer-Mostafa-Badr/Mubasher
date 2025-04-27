import 'package:mubasher_app/features/auth/widgets/components/auth_export_file.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          return Form(
            key: state.formKey,
            child: Scaffold(
              body: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  children: [
                    Center(
                      child: Image.asset(
                        AssetsManager.underCityLife,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextSpanManager(
                      textAlign: TextAlign.start,
                      textOne: context.lang.loginText,
                      fontSizeTextOne: 25.px,
                      fontWeightTextOne: FontWeight.w500,
                      colorTextOne: ColorManager.primaryColor,
                      latterSpaceTextOne: 0.5,
                      fontFamilyTextOne: "Lato",
                      textTwo: context.lang.signInText,
                      fontSizeTextTwo: 25.px,
                      fontWeightTextTwo: FontWeight.w900,
                      colorTextTwo: ColorManager.primaryColor,
                      fontFamilyTextTwo: "Lato",
                      latterSpaceTextTwo: 0.5,
                    ),
                    SizedBox(height: 1.h),
                    AppText(
                      text: context.lang.descriptionLoginText,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.px,
                    ),
                    SizedBox(height: 2.h),
                    CustomEmailTextFormField(),
                    CustomPasswordTextFormField(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: AppText(
                          fontFamily: "Raleway",
                          fontSize: 16.px,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          text: context.lang.forgotPasswordText,
                          textColor: ColorManager.red,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButtonManager(
                      text: context.lang.login,
                      onPressed: () {
                        context.read<RegistrationCubit>().login(context);
                      },
                    ),
                    SizedBox(height: 2.h),
                    TextSpanManager(
                      textOne: context.lang.notHaveAccount,
                      colorTextOne: ColorManager.grey,
                      textTwo: context.lang.register,
                      colorTextTwo: ColorManager.primaryColor,
                      onTap: (value) {
                        Navigator.pushNamed(context, PageRouteName.signUpRoute);
                      },
                    ),
                    SizedBox(height: 4.h),
                    OutlineButtonManager(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
