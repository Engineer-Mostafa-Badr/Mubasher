import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({super.key, this.isHomeView = false});
  final bool isHomeView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          isHomeView
              ? EdgeInsets.symmetric(horizontal: 5.w)
              : EdgeInsets.symmetric(horizontal: 0.w),
      child: Transform.translate(
        offset: const Offset(0, -40),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 4.h,
              horizontal: 3.w,
            ),
            hintText: context.lang.searchHintText,
            hintStyle: TextStyle(
              color: ColorManager.primaryColor,
              fontSize: 16.px,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: SvgPicture.asset(
                SvgImagesManager.search,
                width: 2.2.h,
                height: 2.2.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: SvgPicture.asset(
                SvgImagesManager.micActive,
                width: 2.2.h,
                height: 2.2.h,
                fit: BoxFit.contain,
              ),
            ),
            filled: true,
            fillColor: ColorManager.greyTextFormField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
