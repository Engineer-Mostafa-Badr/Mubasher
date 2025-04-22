import 'package:mubasher_app/features/auth/widgets/sign_in_export_file.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:mubasher_app/features/auth/widgets/password.dart';
import 'package:mubasher_app/features/auth/widgets/email.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final golden = const Color(0xFFB98A35);
    final textStyle = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        buildWhen:
            (previous, current) =>
                previous.isShowPasswrd != current.isShowPasswrd,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                children: [
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      SvgImagesManager.arrowBack,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      style: textStyle.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Create your ",
                          style: TextStyle(color: golden),
                        ),
                        const TextSpan(
                          text: "account",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "quis nostrud exercitation ullamco laboris nisi ut",
                    style: textStyle.bodyMedium?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppTextFormField(
                    textEditingController: state.nameController,
                    hinText: "Full Name",
                    prefix: SvgPicture.asset(
                      SvgImagesManager.profile,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  EmailWidget(),
                  AppTextFormField(
                    textEditingController: state.phoneController,
                    hinText: "Phone Number",
                    prefix: SvgPicture.asset(
                      SvgImagesManager.phone,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  AppTextFormField(
                    textEditingController: state.whatsAppController,
                    hinText: "WhatsApp",
                    prefix: SvgPicture.asset(
                      SvgImagesManager.vector,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorManager.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  PasswordWidget(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Terms of service",
                          style: textStyle.bodySmall,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PageRouteName.activateRoute,
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<RegistrationCubit>().showHidePassword();
                        },
                        child: Text(
                          state.isShowPasswrd
                              ? "Show password"
                              : "Hide password",
                          style: textStyle.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: golden,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
