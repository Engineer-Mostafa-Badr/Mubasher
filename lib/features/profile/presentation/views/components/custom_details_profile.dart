import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_state.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomDetailsProfile extends StatefulWidget {
  const CustomDetailsProfile({
    super.key,
    this.onTap,
    required this.text,
    this.isPaymentView = false,
    this.isEditView = false,
  });

  final Function()? onTap;
  final String text;
  final bool isPaymentView;
  final bool isEditView;

  @override
  State<CustomDetailsProfile> createState() => _CustomDetailsProfileState();
}

class _CustomDetailsProfileState extends State<CustomDetailsProfile> {
  File? selectedImage;

  Future<void> _showImagePicker() async {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('اختيار من المعرض'),
                  onTap: () async {
                    Navigator.pop(context);
                    final picked = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (picked != null) {
                      setState(() {
                        selectedImage = File(picked.path);
                      });
                      // هنا ممكن تبعت الصورة للبلوك
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('التقاط بالكاميرا'),
                  onTap: () async {
                    Navigator.pop(context);
                    final picked = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                    );
                    if (picked != null) {
                      setState(() {
                        selectedImage = File(picked.path);
                      });
                      // هنا ممكن تبعت الصورة للبلوك
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('إزالة الصورة'),
                  onTap: () {
                    setState(() {
                      selectedImage = null;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Row(
                children: [
                  ArrowBackLeadingAppbar(onTap: widget.onTap),
                  Padding(
                    padding: EdgeInsets.only(left: 26.w),
                    child: AppText(
                      fontSize: 16.px,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      textColor: ColorManager.primaryColor,
                      text: widget.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            widget.isPaymentView
                ? const SizedBox()
                : Column(
                  children: [
                    GestureDetector(
                      onTap: widget.isEditView ? _showImagePicker : null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.px),
                        child:
                            selectedImage != null
                                ? Image.file(
                                  selectedImage!,
                                  width: 100.px,
                                  height: 100.px,
                                  fit: BoxFit.cover,
                                )
                                : Container(
                                  color:
                                      ColorManager.backgroundContainerProfile,
                                  width: 100.px,
                                  height: 100.px,
                                  child: Icon(
                                    Icons.person,
                                    size: 50.px,
                                    color: ColorManager.primaryColor,
                                  ),
                                ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Center(
                      child: AppText(
                        fontSize: 16.px,
                        fontFamily: 'Lato',
                        textColor: ColorManager.primaryColor,
                        fontWeight: FontWeight.w700,
                        text:
                            state is ProfileLoaded
                                ? state.user.userName
                                : 'Loading...',
                      ),
                    ),
                  ],
                ),
          ],
        );
      },
    );
  }
}
