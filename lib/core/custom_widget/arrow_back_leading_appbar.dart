import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class ArrowBackLeadingAppbar extends StatelessWidget {
  const ArrowBackLeadingAppbar({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 13.w,
          height: 6.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                SvgImagesManager.arrowBackBackground,
                fit: BoxFit.cover,
                width: 6.w,
                height: 6.h,
              ),
              SvgPicture.asset(
                SvgImagesManager.arrowBack,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorManager.primaryColor,
                  BlendMode.srcIn,
                ),
                width: 3.w,
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
