import '../../../../core/resources/app_color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanManager extends StatelessWidget {
  const TextSpanManager({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.onTap,
  });

  final String textOne;
  final String textTwo;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: textOne,
          style: TextStyle(color: ColorManager.grey),
          children: [
            TextSpan(
              text: textTwo,
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 16.px,
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.w500,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      onTap?.call(textTwo);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
