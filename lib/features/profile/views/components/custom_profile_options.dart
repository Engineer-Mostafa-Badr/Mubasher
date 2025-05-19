import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class ProfileOption extends StatelessWidget {
  final String? iconAsset;
  final String backgroundAsset;
  final String label;
  final Function()? onTap;
  final bool isChangeLanguage;
  final String? assetPath;

  const ProfileOption({
    super.key,
    this.iconAsset,
    required this.backgroundAsset,
    required this.label,
    this.onTap,
    this.isChangeLanguage = false,
    this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: label,
          textColor: ColorManager.primaryColor,
          fontSize: 14.px,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                isChangeLanguage
                    ? Image.asset(
                      assetPath ?? '',
                      width: 12.w,
                      height: 10.h,
                      color: ColorManager.iconProfileColor,
                    )
                    : SvgPicture.asset(
                      iconAsset ?? '',
                      width: 5.w,
                      height: 4.h,
                    ),
                SvgPicture.asset(backgroundAsset, width: 10.w, height: 12.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
