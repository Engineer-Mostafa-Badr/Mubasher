import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomChangePasswordTextFormField extends StatelessWidget {
  const CustomChangePasswordTextFormField({
    super.key,
    this.isShowContent = false,
    this.onTap,
    required this.textEditingController,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final bool isShowContent;
  final Function()? onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      textEditingController: textEditingController,
      hinText: hintText,
      isShowContent: isShowContent,
      keyboardType: TextInputType.visiblePassword,
      validate:
          (password) => context.read<RegistrationCubit>().validatePassword(
            context: context,
            password: password,
          ),
      suffix: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          SvgImagesManager.lock,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            ColorManager.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
