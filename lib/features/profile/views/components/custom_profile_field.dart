import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class ProfileField extends StatelessWidget {
  final String title;
  final String value;
  final bool isEditable;
  final bool isPassword;

  const ProfileField({
    super.key,
    required this.title,
    required this.value,
    this.isEditable = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            fontSize: 14.px,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            textColor: ColorManager.primaryColor,
          ),
          SizedBox(height: 0.2.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF6E9),
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
                  child:
                      isEditable
                          ? TextFormField(
                            controller: controller,
                            obscureText: isPassword,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                          : AppText(
                            text:
                                value.isNotEmpty
                                    ? value
                                    : context.lang.password,
                            textColor: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                ),
                if (isEditable)
                  SvgPicture.asset(
                    SvgImagesManager.editIcon,
                    height: 18,
                    width: 18,
                  )
                else if (isPassword)
                  SvgPicture.asset(
                    SvgImagesManager.arrowRightIcon,
                    height: 18,
                    width: 18,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
