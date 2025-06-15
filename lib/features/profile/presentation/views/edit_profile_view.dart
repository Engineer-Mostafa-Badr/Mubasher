import 'package:mubasher_app/features/profile/presentation/views/components/custom_details_profile.dart';
import 'package:mubasher_app/features/profile/presentation/views/components/custom_profile_field.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_state.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_event.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_bloc.dart';
import 'package:mubasher_app/features/auth/data/models/user_model.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController whatsappController;
  late TextEditingController emailController;
  late TextEditingController countryController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    whatsappController = TextEditingController();
    emailController = TextEditingController();
    countryController = TextEditingController(text: 'Egypt');

    final state = context.read<ProfileBloc>().state;
    if (state is ProfileLoaded) {
      _fillControllers(state.user);
    }
  }

  void _fillControllers(UserModel user) {
    nameController.text = user.userName;
    phoneController.text = user.phoneno;
    whatsappController.text = user.whatsapp;
    emailController.text = user.email;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    emailController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileLoading) {
              AppNotifier().showLoading();
            } else if (state is UpdateProfileSuccess) {
              AppNotifier().hideLoading(); // ✅ أغلق اللودينج بوضوح
              AppNotifier().showSuccess(
                context,
                'profile updated successfully',
              );
              Navigator.pop(context); // رجوع بعد التحديث فقط
            } else if (state is UpdateProfileFailure) {
              AppNotifier().hideLoading(); // ✅ أغلق اللودينج بوضوح
              AppNotifier().showError(context, 'failed to update profile');
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                final user = state.user;
                _fillControllers(user);
                return ListView(
                  children: [
                    CustomDetailsProfile(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteName.profileOptionsRoute,
                        );
                      },
                      isEditView: true,
                      text: context.lang.profileText,
                    ),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileField(
                            title: context.lang.nameText,
                            controller: nameController,
                          ),
                          ProfileField(
                            title: context.lang.phoneText,
                            controller: phoneController,
                          ),
                          ProfileField(
                            title: context.lang.whatsAppText,
                            controller: whatsappController,
                          ),
                          ProfileField(
                            title: context.lang.emailText,
                            controller: emailController,
                          ),
                          ProfileField(
                            title: context.lang.countryText,
                            controller: countryController,
                          ),
                          SizedBox(height: 2.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PageRouteName.changePasswordRoute,
                                arguments: user,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 7.h,
                              decoration: BoxDecoration(
                                color: ColorManager.editProfileFieldColor,
                                borderRadius: BorderRadius.circular(16.w),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 2.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: context.lang.changePasswordText,
                                      fontSize: 16.px,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      textColor: ColorManager.primaryColor,
                                    ),
                                    SvgPicture.asset(
                                      SvgImagesManager.arrowRightIcon,
                                      height: 2.h,
                                      width: 5.w,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),
                    ElevatedButtonManager(
                      text: context.lang.saveChangesText,
                      onPressed: () {
                        final updatedData = {
                          "id": user.id, // ← أهم حاجة
                          "user_name": nameController.text,
                          "email": emailController.text,
                          "phoneno": phoneController.text,
                          "whatsapp": whatsappController.text,
                        };

                        context.read<ProfileBloc>().add(
                          SubmitUpdateUserProfileEvent(userData: updatedData),
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                  ],
                );
              } else if (state is ProfileLoadFailure) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
