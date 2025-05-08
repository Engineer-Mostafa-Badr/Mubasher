import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class RegisterTextFormField extends StatelessWidget {
  const RegisterTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIconPath,
    this.validate,
    this.keyboardType,
    this.color,
    this.labelText,
    this.suffix,
  });
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String prefixIconPath;
  final Widget? suffix;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      keyboardType: keyboardType,
      validate: validate,
      textEditingController: controller,
      hinText: hintText,
      labelText: labelText,
      color: color,
      suffix: suffix,
      prefix: SvgPicture.asset(
        prefixIconPath,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(
          ColorManager.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
