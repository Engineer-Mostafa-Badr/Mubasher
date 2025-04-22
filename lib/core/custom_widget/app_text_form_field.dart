import 'package:responsive_sizer/responsive_sizer.dart';
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
  InputBorder border({
    bool isErrorBorder = false,
    required BuildContext context,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.w),
    borderSide: BorderSide(
      color: isErrorBorder ? ColorManager.red : ColorManager.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 1.w,
        vertical: verticalPadding ?? 1.h,
      ),
      child: TextFormField(
        controller: textEditingController,
        validator: validate,
        obscureText: isShowContent,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hinText,
          labelText: labelText,
          filled: isFill,
          errorMaxLines: 2,
          fillColor: ColorManager.white,
          enabledBorder: border(context: context),
          focusedBorder: border(context: context),
          border: border(context: context),
          errorBorder: border(isErrorBorder: true, context: context),
        ),
      ),
    );
  }
}
