import 'package:mubasher_app/core/custom_widget/app_text_form_field.dart';
import 'package:mubasher_app/features/auth/widgets/auth_export_file.dart';
import 'package:flutter_svg/svg.dart';

class RegisterTextFormField extends StatelessWidget {
  const RegisterTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIconPath,
    this.validate,
    this.keyboardType,
    this.color,
  });
  final TextEditingController controller;
  final String hintText;
  final String prefixIconPath;
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
      color: color,
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
