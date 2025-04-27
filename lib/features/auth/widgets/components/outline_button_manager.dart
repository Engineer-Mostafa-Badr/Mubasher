import 'package:mubasher_app/features/auth/widgets/components/sign_in_export_file.dart';
import '../../../../core/custom_widget/app_text_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/route/routes.dart';

class OutlineButtonManager extends StatelessWidget {
  const OutlineButtonManager({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          foregroundColor: ColorManager.primaryColor,
          side: BorderSide(color: ColorManager.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, PageRouteName.homeRoute);
        },
        child: AppText(
          text: context.lang.endTextLoginText,
          fontWeight: FontWeight.w700,
          fontSize: 18.px,
          fontFamily: "Lato",
          textColor: ColorManager.primaryColor,
        ),
      ),
    );
  }
}
