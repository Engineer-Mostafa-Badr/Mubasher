import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class ProfileField extends StatelessWidget {
  final String? title;
  final String value;

  const ProfileField({super.key, this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title!,
          fontSize: 14.px,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
          textColor: ColorManager.primaryColor,
        ),
        SizedBox(height: 0.2.h),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: .50.h),
            decoration: BoxDecoration(
              color: ColorManager.editProfileFieldColor,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.px,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),

                SvgPicture.asset(
                  SvgImagesManager.editIcon,
                  height: 3.h,
                  width: 7.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
