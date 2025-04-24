import 'package:mubasher_app/features/auth/widgets/sign_in_export_file.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          textEditingController: state.passwordController,
          hinText: context.lang.password,
          color: ColorManager.grey,
          validate:
              (password) => context.read<RegistrationCubit>().validatePassword(
                context: context,
                password: password,
              ),
          isShowContent: state.isShowPasswrd,
          prefix: SvgPicture.asset(
            SvgImagesManager.lock,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorManager.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
