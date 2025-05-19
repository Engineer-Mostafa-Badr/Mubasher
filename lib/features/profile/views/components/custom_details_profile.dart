import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomDetailsProfile extends StatelessWidget {
  const CustomDetailsProfile({
    super.key,
    this.onTap,
    required this.text,
    this.isPaymentView = false,
  });

  final Function()? onTap;
  final String text;
  final bool isPaymentView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Row(
            children: [
              ArrowBackLeadingAppbar(onTap: onTap),
              Padding(
                padding: EdgeInsets.only(left: 26.w),
                child: AppText(
                  fontSize: 16.px,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  textColor: ColorManager.primaryColor,
                  text: text,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        isPaymentView
            ? Text('')
            : Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AssetsManager.ellipse2),
                ),
                SizedBox(height: 1.h),
                Center(
                  child: AppText(
                    fontSize: 16.px,
                    fontFamily: 'Lato',
                    textColor: ColorManager.primaryColor,
                    fontWeight: FontWeight.w700,
                    text: 'Sallem ahmed',
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
