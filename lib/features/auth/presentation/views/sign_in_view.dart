import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final registrationCubit = context.read<RegistrationCubit>();
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              AppNotifier().showLoading();
            } else {
              AppNotifier().hideLoading();
            }
            if (state is AuthError) {
              AppNotifier().showError(
                context,
                "Check your email or password, and try again",
              );
            } else if (state is AuthLoaded) {
              Future.microtask(() {
                // ignore: use_build_context_synchronously
                AppNotifier().showSuccess(context, "Login Successfully");
                Navigator.pushReplacementNamed(
                  // ignore: use_build_context_synchronously
                  context,
                  PageRouteName.homeSellerRoute,
                );
              });
            }
          },
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, regState) {
              return Form(
                key: registrationCubit.state.formKey,
                child: Scaffold(
                  body: SafeArea(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      children: [
                        Center(
                          child: Image.asset(
                            AssetsManager.underCityLife,
                            height: 15.h,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap:
                                  () => registrationCubit.selectUserType(
                                    isSeller: false,
                                  ),
                              child: Container(
                                height: 9.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                  color:
                                      regState.isUser
                                          ? ColorManager.green
                                          : ColorManager.greyTextFormField,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      SvgImagesManager.profileUserSeller,
                                      height: 5.h,
                                    ),
                                    AppText(
                                      text: context.lang.userText,
                                      textColor:
                                          regState.isUser
                                              ? ColorManager.primaryColor
                                              : ColorManager.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => registrationCubit.selectUserType(
                                    isSeller: true,
                                  ),
                              child: Container(
                                height: 9.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                  color:
                                      regState.isSeller
                                          ? ColorManager.green
                                          : ColorManager.greyTextFormField,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      SvgImagesManager.profileUserSeller,
                                      height: 5.h,
                                    ),
                                    AppText(
                                      text: context.lang.sellerText,
                                      textColor:
                                          regState.isSeller
                                              ? ColorManager.primaryColor
                                              : ColorManager.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        TextSpanManager(
                          textAlign: TextAlign.start,
                          textOne: context.lang.letsText,
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
                        if (!context.isArabic) ...[
                          AppText(
                            text: context.lang.descriptionLoginText,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.px,
                          ),
                          SizedBox(height: 2.h),
                        ],
                        CustomEmailTextFormField(),
                        CustomPasswordTextFormField(
                          isLogin: true,
                          onTap: () {
                            registrationCubit.showHidePassword();
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                PageRouteName.forgotPasswordRoute,
                              );
                            },
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
                          text: context.lang.loginText,
                          onPressed: () {
                            if (!regState.isUser && !regState.isSeller) {
                              AppNotifier().showError(
                                context,
                                context.lang.chooseAccountText,
                              );
                              return;
                            }
                            if (registrationCubit.state.formKey.currentState!
                                .validate()) {
                              context.read<AuthBloc>().add(
                                LoginEvent(
                                  username:
                                      registrationCubit
                                          .state
                                          .emailController
                                          .text
                                          .trim(),
                                  password:
                                      registrationCubit
                                          .state
                                          .passwordController
                                          .text
                                          .trim(),
                                  isSeller: regState.isSeller,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 2.h),
                        TextSpanManager(
                          textOne: context.lang.notHaveAccountText,
                          colorTextOne: ColorManager.grey,
                          textTwo: context.lang.registerText,
                          colorTextTwo: ColorManager.primaryColor,
                          onTap: (value) {
                            if (regState.isSeller) {
                              Navigator.pushNamed(
                                context,
                                PageRouteName.signUpSellerRoute,
                              );
                            } else if (regState.isUser) {
                              Navigator.pushNamed(
                                context,
                                PageRouteName.signUpUserRoute,
                              );
                            } else if (!regState.isUser && !regState.isSeller) {
                              AppNotifier().showError(
                                context,
                                context.lang.chooseAccountText,
                              );
                              return;
                            }
                          },
                        ),
                        SizedBox(height: 4.h),
                        OutlineButtonManager(),
                        SizedBox(height: 3.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
