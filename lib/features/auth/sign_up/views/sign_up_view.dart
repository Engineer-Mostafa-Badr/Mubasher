import 'package:mubasher_app/features/auth/widgets/components/auth_export_file.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        buildWhen:
            (previous, current) =>
                previous.isShowPasswrd != current.isShowPasswrd,
        builder: (context, state) {
          return Form(
            key: state.formKey,
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
                          (name) => context
                              .read<RegistrationCubit>()
                              .validateName(context: context, name: name),
                      controller: state.nameController,
                      hintText: context.lang.fullNameText,

                      color: ColorManager.grey,
                      prefixIconPath: SvgImagesManager.profile,
                      keyboardType: TextInputType.name,
                    ),
                    CustomEmailTextFormField(),
                    RegisterTextFormField(
                      validate:
                          (phone) => context
                              .read<RegistrationCubit>()
                              .validatePhoneNumber(
                                context: context,
                                phoneNumber: phone,
                              ),
                      controller: state.phoneController,
                      hintText: context.lang.phoneNumberText,
                      color: ColorManager.grey,
                      prefixIconPath: SvgImagesManager.phone,
                    ),
                    RegisterTextFormField(
                      validate:
                          (whatsApp) => context
                              .read<RegistrationCubit>()
                              .validateWhatsApp(
                                context: context,
                                whatsAppNumber: whatsApp,
                              ),
                      controller: state.whatsAppController,
                      hintText: context.lang.whatsAppText,
                      color: ColorManager.grey,
                      prefixIconPath: SvgImagesManager.vector,
                      keyboardType: TextInputType.phone,
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
                            context
                                .read<RegistrationCubit>()
                                .showHidePassword();
                          },
                          child: AppText(
                            text:
                                state.isShowPasswrd
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
                        context.read<RegistrationCubit>().signUp(context);
                      },
                    ),
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
