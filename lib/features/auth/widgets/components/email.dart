import 'package:mubasher_app/core/resources/app_color_manager.dart';
import '../../../../core/custom_widget/app_text_form_field.dart';
import '../../../../core/custom_widget/app_icon_manager.dart';
import 'package:mubasher_app/core/extension/context.dart';
import '../../sign_in/logic/bloc/registration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return AppTextFormField(
          textEditingController: state.emailController,
          hinText: context.lang.email,
          validate:
              (text) => context.read()<RegistrationCubit>().validateEmail(
                context: context,
                text: text,
              ),
          prefix: AppIcon(
            icon: Iconsax.sms,
            iconColor: ColorManager.primaryColor,
            // iconSize: 20,
          ),
        );
      },
    );
  }
}
