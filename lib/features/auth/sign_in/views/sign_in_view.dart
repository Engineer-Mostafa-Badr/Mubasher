import 'package:mubasher_app/features/auth/widgets/auth_export_file.dart';
import 'package:mubasher_app/core/route/routes.dart';

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AssetsManager.underCityLife,
                            height: 20.h,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text.rich(
                          TextSpan(
                            text: context.lang.loginText,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: context.lang.signIn,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h),
                        AppText(
                          text: context.lang.descriptionLoginText,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.px,
                        ),
                        SizedBox(height: 2.h),
                        EmailWidget(),
                        PasswordWidget(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: AppText(
                              fontFamily: "Raleway",
                              fontSize: 16.px,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              text: context.lang.forgotPassword,
                              textColor: ColorManager.red,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        ElevatedButtonManager(
                          text: context.lang.login,
                          onPressed: () {
                            context.read<RegistrationCubit>().login();
                          },
                        ),
                        SizedBox(height: 2.h),
                        TextSpanManager(
                          textOne: context.lang.notHaveAccount,
                          textTwo: context.lang.register,
                          onTap: (value) {
                            Navigator.pushNamed(
                              context,
                              PageRouteName.signUpRoute,
                            );
                          },
                        ),
                        SizedBox(height: 4.h),
                        OutlineButtonManager(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
