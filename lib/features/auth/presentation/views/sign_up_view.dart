import 'package:mubasher_app/features/auth/presentation/views/components/phone_whatsapp_choice_dial_code.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<RegistrationCubit>();
          return BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                AppNotifier().showLoading();
              } else {
                AppNotifier().hideLoading();
              }

              if (state is AuthError) {
                AppNotifier().showError(
                  context,
                  "Check all field , and try again",
                );
              } else if (state is AuthLoaded) {
                Future.microtask(() {
                  // ignore: use_build_context_synchronously
                  AppNotifier().showSuccess(context, "Sign Up Successfully");
                  Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    PageRouteName.activateRoute,
                  );
                });
              }
            },
            builder: (context, state) {
              return BlocBuilder<RegistrationCubit, RegistrationState>(
                buildWhen:
                    (previous, current) =>
                        previous.isShowPassword != current.isShowPassword ||
                        previous.selectedPhoneCode !=
                            current.selectedPhoneCode ||
                        previous.selectedPhoneFlag !=
                            current.selectedPhoneFlag ||
                        previous.selectedWhatsAppCode !=
                            current.selectedWhatsAppCode ||
                        previous.selectedWhatsAppFlag !=
                            current.selectedWhatsAppFlag,

                builder: (context, regState) {
                  return Form(
                    key: regState.formKey,
                    child: Scaffold(
                      body: SafeArea(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          children: [
                            ArrowBackLeadingAppbar(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  PageRouteName.signInRoute,
                                );
                              },
                            ),
                            SizedBox(height: 4.h),
                            TextSpanManager(
                              textAlign: TextAlign.start,
                              textOne: context.lang.createyourText,
                              fontSizeTextOne: 25.px,
                              fontWeightTextOne: FontWeight.w500,
                              colorTextOne: ColorManager.primaryColor,
                              latterSpaceTextOne: 0.5,
                              fontFamilyTextOne: "Lato",
                              textTwo: context.lang.accountText,
                              fontSizeTextTwo: 25.px,
                              fontWeightTextTwo: FontWeight.w800,
                              colorTextTwo: ColorManager.black,
                              fontFamilyTextTwo: "Lato",
                              latterSpaceTextTwo: 0.5,
                            ),
                            SizedBox(height: 2.h),
                            AppText(
                              text: context.lang.descriptionLoginText,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.px,
                            ),
                            SizedBox(height: 3.5.h),
                            RegisterTextFormField(
                              validate:
                                  (name) => cubit.validateName(
                                    context: context,
                                    name: name,
                                  ),
                              controller: regState.nameController,
                              hintText: context.lang.fullNameText,
                              labelText: context.lang.fullNameText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.profile,
                              keyboardType: TextInputType.name,
                            ),
                            CustomEmailTextFormField(),
                            RegisterTextFormField(
                              validate:
                                  (phone) => cubit.validatePhoneNumber(
                                    context: context,
                                    phoneNumber: phone,
                                  ),
                              controller: regState.phoneController,
                              hintText: context.lang.phoneNumberText,
                              labelText: context.lang.phoneNumberText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.phone,
                              keyboardType: TextInputType.phone,
                              suffix: GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return CountryListWidget(
                                        onCountrySelected: (code, flag) {
                                          cubit.updatePhoneCode(code, flag);
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${regState.selectedPhoneFlag} ${regState.selectedPhoneCode}',
                                      style: TextStyle(
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.primaryColor,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                            RegisterTextFormField(
                              validate:
                                  (whatapp) => cubit.validateWhatsApp(
                                    context: context,
                                    whatsAppNumber: whatapp,
                                  ),
                              controller: regState.whatsAppController,
                              hintText: context.lang.whatsAppText,
                              labelText: context.lang.whatsAppText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.vector,
                              keyboardType: TextInputType.phone,
                              suffix: GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return CountryListWidget(
                                        onCountrySelected: (code, flag) {
                                          cubit.updateWhatsAppCode(code, flag);
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${regState.selectedWhatsAppFlag} ${regState.selectedWhatsAppCode}',
                                      style: TextStyle(
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.primaryColor,
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                              ),
                            ),
                            CustomPasswordTextFormField(),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: context.lang.termsOfServiceText,
                                  textColor: ColorManager.black,
                                  fontSize: 14.px,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.showHidePassword();
                                  },
                                  child: AppText(
                                    text:
                                        regState.isShowPassword
                                            ? context.lang.showPasswordText
                                            : context.lang.hidePasswordText,
                                    textColor: ColorManager.black,
                                    fontSize: 14.px,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            ElevatedButtonManager(
                              text: context.lang.register,
                              onPressed: () {
                                if (regState.formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    RegisterEvent(
                                      username:
                                          regState.nameController.text.trim(),
                                      email:
                                          regState.emailController.text.trim(),
                                      password:
                                          regState.passwordController.text
                                              .trim(),
                                      confirmPassword:
                                          regState.passwordController.text
                                              .trim(),
                                      phone:
                                          regState.phoneController.text.trim(),
                                      whatsapp:
                                          regState.whatsAppController.text
                                              .trim(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
