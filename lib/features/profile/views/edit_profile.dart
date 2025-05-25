import 'package:mubasher_app/features/profile/views/components/custom_details_profile.dart';
import 'package:mubasher_app/features/profile/views/components/custom_profile_field.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:mubasher_app/core/custom_widget/app_text_manager.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:mubasher_app/core/resources/app_color_manager.dart';
import 'package:mubasher_app/core/extension/context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, this.user});
  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: ListView(
          children: [
            CustomDetailsProfile(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PageRouteName.profileOptionsRoute,
                );
              },
              text: context.lang.profileText,
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileField(
                    title: context.lang.nameText,
                    value: user?.userName ?? 'unknown',
                  ),
                  ProfileField(
                    title: context.lang.phoneText,
                    value: user?.phoneno ?? 'unknown',
                  ),
                  ProfileField(
                    title: context.lang.whatsAppText,
                    value: user?.whatsapp ?? 'unknown',
                  ),
                  ProfileField(
                    title: context.lang.emailText,
                    value: user?.email ?? 'unknown',
                  ),
                  ProfileField(title: context.lang.countryText, value: 'Egypt'),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PageRouteName.changePasswordRoute,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: ColorManager.editProfileFieldColor,
                        borderRadius: BorderRadius.circular(16.w),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: context.lang.passwordText,
                              fontSize: 16.px,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              textColor: ColorManager.primaryColor,
                            ),
                            SvgPicture.asset(
                              SvgImagesManager.arrowRightIcon,
                              height: 2.h,
                              width: 5.w,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
