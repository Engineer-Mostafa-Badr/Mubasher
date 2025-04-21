import '../../../../core/custom_widget/app_text_form_field.dart';
import 'package:mubasher_app/core/extension/context.dart';
import '../../sign_in/logic/bloc/registration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen:
          (previous, current) =>
              previous.isShowPasswrd != current.isShowPasswrd,
      builder: (context, state) {
        return AppTextFormField(
          validate:
              (password) => context.read<RegistrationCubit>().validatePassword(
                context: context,
                password: password,
              ),
          textEditingController: state.passwordController,
          hinText: context.lang.password,
          isShowContent: state.isShowPasswrd,
          suffix: IconButton(
            onPressed:
                () => context.read<RegistrationCubit>().showHidePassword(),
            icon: Icon(
              state.isShowPasswrd ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        );
      },
    );
  }
}
