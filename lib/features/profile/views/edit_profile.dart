import 'package:mubasher_app/features/profile/views/components/custom_details_profile.dart';
import 'package:mubasher_app/features/profile/views/components/custom_profile_field.dart';
import 'package:mubasher_app/core/resources/app_color_manager.dart';
import 'package:mubasher_app/core/extension/context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
                    value: 'Sallem ahmed',
                    isEditable: true,
                  ),
                  ProfileField(
                    title: context.lang.phoneText,
                    value: '+996 234567 345',
                    isEditable: true,
                  ),
                  ProfileField(
                    title: context.lang.whatsAppText,
                    value: '+996 3456787654',
                    isEditable: true,
                  ),
                  ProfileField(
                    title: context.lang.email,
                    value: 'saLLEM3@gmail.com',
                    isEditable: true,
                  ),
                  ProfileField(
                    title: context.lang.countryText,
                    value: 'Egypt',
                    isEditable: true,
                  ),
                  ProfileField(
                    title: '',
                    value: context.lang.password,
                    isPassword: true,
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
