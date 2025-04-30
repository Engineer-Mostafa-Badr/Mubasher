import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Transform.translate(
        offset: const Offset(0, -30),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 23.0,
              horizontal: 16.0,
            ),
            hintText: 'Search House, Apartment, etc',
            hintStyle: const TextStyle(
              color: ColorManager.primaryColor,
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                SvgImagesManager.search,
                width: 2.2.h,
                height: 2.2.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                SvgImagesManager.micActive,
                width: 2.2.h,
                height: 2.2.h,
                fit: BoxFit.contain,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
