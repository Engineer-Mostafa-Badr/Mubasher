import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/phone_whatsapp_choice_dial_code.dart';

class SignUpSellerView extends StatelessWidget {
  const SignUpSellerView({super.key});

  String normalizeNumber(String code, String number) {
    final cleaned =
        number.trim().startsWith('0')
            ? number.trim().substring(1)
            : number.trim();
    return "$code$cleaned";
  }

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
                    arguments: state.user,
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
                            current.selectedWhatsAppFlag ||
                        previous.profileImage != current.profileImage,
                builder: (context, regState) {
                  return Form(
                    key: regState.formKey,
                    child: Scaffold(
                      backgroundColor: ColorManager.white,
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
                            SizedBox(height: 2.h),

                            TextSpanManager(
                              textAlign: TextAlign.start,
                              textOne: context.lang.createYourSellerText,
                              fontSizeTextOne: 25.px,
                              fontWeightTextOne: FontWeight.w500,
                              colorTextOne: ColorManager.primaryColor,
                              latterSpaceTextOne: 0.5,
                              fontFamilyTextOne: "Lato",
                              textTwo:
                                  context.isArabic
                                      ? context.lang.sellerText
                                      : context.lang.accountText,
                              fontSizeTextTwo: 25.px,
                              fontWeightTextTwo: FontWeight.w800,
                              colorTextTwo: ColorManager.black,
                              fontFamilyTextTwo: "Lato",
                              latterSpaceTextTwo: 0.5,
                            ),
                            SizedBox(height: 2.h),
                            if (!context.isArabic) ...[
                              AppText(
                                text: context.lang.descriptionLoginText,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w500,
                                fontSize: 16.px,
                              ),
                              SizedBox(height: 2.h),
                            ],
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
                                    selectedPhoneCode:
                                        regState.selectedPhoneCode,
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
                                    selectedPhoneCode:
                                        regState.selectedPhoneCode,
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
                            RegisterTextFormField(
                              controller: regState.facebookController,
                              hintText: context.lang.facebookText,
                              labelText: context.lang.facebookText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.facebookIcon,
                              keyboardType: TextInputType.url,
                            ),
                            SizedBox(height: 1.h),
                            GestureDetector(
                              onTap: () async {
                                await cubit.pickProfileImage();
                                final path = cubit.state.profileImage?.path;
                                if (path != null) {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setString(
                                    'profile_image_path',
                                    path,
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.greyTextFormField,
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 3.w,
                                ),
                                child: Row(
                                  children: [
                                    if (cubit.state.profileImage != null)
                                      CircleAvatar(
                                        radius: 5.w,
                                        backgroundImage: FileImage(
                                          cubit.state.profileImage!,
                                        ),
                                      )
                                    else
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[300],
                                        child: SvgPicture.asset(
                                          SvgImagesManager.profilePictureIcon,
                                          width: 7.w,
                                          height: 2.h,
                                        ),
                                      ),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                      child: Text(
                                        cubit.state.profileImage != null
                                            ? cubit.state.profileImage!.path
                                                .split('/')
                                                .last
                                            : context.lang.profilePictureText,
                                        style: TextStyle(
                                          color: ColorManager.grey,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            RegisterTextFormField(
                              validate:
                                  (documents) => cubit.validateDocuments(
                                    context: context,
                                    documents: documents,
                                  ),
                              controller: regState.documentsController,
                              hintText: context.lang.documentsText,
                              labelText: context.lang.documentsText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.documentsIcon,
                              keyboardType: TextInputType.text,
                            ),
                            RegisterTextFormField(
                              validate:
                                  (country) => cubit.validateCountry(
                                    context: context,
                                    country: country,
                                  ),
                              controller: regState.countryController,
                              hintText: context.lang.countryText,
                              labelText: context.lang.countryText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.countryCityIcon,
                              keyboardType: TextInputType.text,
                            ),
                            RegisterTextFormField(
                              validate:
                                  (city) => cubit.validateCity(
                                    context: context,
                                    city: city,
                                  ),
                              controller: regState.cityController,
                              hintText: context.lang.cityText,
                              labelText: context.lang.cityText,
                              color: ColorManager.grey,
                              prefixIconPath: SvgImagesManager.countryCityIcon,
                              keyboardType: TextInputType.text,
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
                              color: ColorManager.primaryColor,
                              text: context.lang.registerText,
                              onPressed: () {
                                final isImageSelected =
                                    regState.profileImage != null;
                                if (!isImageSelected) {
                                  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                  context.read<RegistrationCubit>().emit(
                                    regState.copyWith(
                                      isProfileImageValid: false,
                                    ),
                                  );
                                }
                                if (regState.formKey.currentState!.validate() &&
                                    isImageSelected) {
                                  final fullPhone = normalizeNumber(
                                    regState.selectedPhoneCode,
                                    regState.phoneController.text,
                                  );
                                  final fullWhatsApp = normalizeNumber(
                                    regState.selectedWhatsAppCode,
                                    regState.whatsAppController.text,
                                  );

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
                                      phone: fullPhone,
                                      whatsapp: fullWhatsApp,
                                      facebook:
                                          regState.facebookController.text
                                              .trim(),
                                      documents:
                                          regState.documentsController.text
                                              .trim(),
                                      country:
                                          regState.countryController.text
                                              .trim(),
                                      city: regState.cityController.text.trim(),
                                      isSeller: cubit.state.isSeller,
                                      isUser: cubit.state.isUser,
                                      profileImage: regState.profileImage!,
                                    ),
                                  );
                                }
                              },
                            ),

                            SizedBox(height: 3.h),
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
