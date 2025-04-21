import '../resources/app_color_manager.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textEditingController,
    this.color,
    this.hinText,
    this.labelText,
    this.isFill = true,
    this.validate,
    this.suffix,
    this.prefix,
    this.horizentalPadding,
    this.verticalPadding,
    this.isShowContent = false,
  });

  final TextEditingController textEditingController;
  final Color? color;
  final String? hinText;
  final String? labelText;
  final bool isFill;
  final String? Function(String? text)? validate;
  final Widget? suffix;
  final Widget? prefix;
  final double? horizentalPadding;
  final double? verticalPadding;
  final bool isShowContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 0,
        vertical: verticalPadding ?? 0,
      ),
      child: TextFormField(
        controller: textEditingController,
        validator: validate,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hinText,
          labelText: labelText,
          fillColor: ColorManager.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
