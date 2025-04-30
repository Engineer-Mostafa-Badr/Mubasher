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
          width: 40,
          height: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                SvgImagesManager.arrowBackBackground,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
              SvgPicture.asset(
                SvgImagesManager.arrowBack,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorManager.primaryColor,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
