import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.textColor,
    this.isBold = false,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.latterSpace,
  });

  final String text;
  final Color? textColor;
  final bool isBold;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? latterSpace;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: fontFamily,
        fontWeight: isBold ? FontWeight.bold : null,
        letterSpacing: latterSpace,
        fontSize: fontSize?.sp ?? 16.sp,
      ),
    );
  }
}
