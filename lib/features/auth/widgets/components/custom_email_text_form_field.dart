import 'package:mubasher_app/features/auth/widgets/components/sign_in_export_file.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return AppTextFormField(
          textEditingController: state.emailController,
          hinText: context.lang.email,
          color: ColorManager.grey,
          validate:
              (email) => context.read<RegistrationCubit>().validateEmail(
                context: context,
                email: email,
              ),
          prefix: SvgPicture.asset(
            SvgImagesManager.email,
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
