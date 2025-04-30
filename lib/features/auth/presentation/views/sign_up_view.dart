import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'dart:developer';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => RegistrationCubit())],
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          log('AuthBloc state changed: $state');
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop(); // إغلاق التحميل
          }

          if (state is AuthLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register Successful')),
            );
            Future.microtask(() {
              Navigator.pushReplacementNamed(
                // ignore: use_build_context_synchronously
                context,
                PageRouteName.activateRoute,
              );
            });
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          final cubit = context.read<RegistrationCubit>();
          return BlocBuilder<RegistrationCubit, RegistrationState>(
            buildWhen:
                (previous, current) =>
                    previous.isShowPasswrd != current.isShowPasswrd,
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
                          color: ColorManager.grey,
                          prefixIconPath: SvgImagesManager.phone,
                        ),
                        RegisterTextFormField(
                          validate:
                              (whatsApp) => cubit.validateWhatsApp(
                                context: context,
                                whatsAppNumber: whatsApp,
                              ),
                          controller: regState.whatsAppController,
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
                                cubit.showHidePassword();
                              },
                              child: AppText(
                                text:
                                    regState.isShowPasswrd
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
                                  username: regState.nameController.text.trim(),
                                  email: regState.emailController.text.trim(),
                                  password:
                                      regState.passwordController.text.trim(),
                                  confirmPassword:
                                      regState.passwordController.text.trim(),
                                  phone: regState.phoneController.text.trim(),
                                  whatsapp:
                                      regState.whatsAppController.text.trim(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill all fields'),
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
      ),
    );
  }
}
