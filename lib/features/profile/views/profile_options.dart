import 'package:mubasher_app/config/app_controller/cubit/app_controller_cubit.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/views/components/custom_details_profile.dart';
import 'package:mubasher_app/features/profile/views/components/custom_profile_options.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';

class ProfileOptionsView extends StatelessWidget {
  const ProfileOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutLoading) {
          AppNotifier().showLoading();
        } else {
          AppNotifier().hideLoading();
        }
        if (state is AuthLoggedOutSuccess) {
          AppNotifier().showSuccess(context, "LogOut Successfully");
          Navigator.pushReplacementNamed(context, PageRouteName.signInRoute);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomDetailsProfile(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.homeRoute,
                  );
                },
                text: context.lang.profileText,
              ),
              SizedBox(height: 2.5.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.backgroundContainerProfile,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14.w),
                      topRight: Radius.circular(14.w),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  child: Center(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.75,
                      children: [
                        ProfileOption(
                          iconAsset: SvgImagesManager.showOutlineIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'Show profile',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              PageRouteName.editProfileRoute,
                            );
                          },
                        ),
                        ProfileOption(
                          iconAsset: SvgImagesManager.editFilledIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'About us',
                        ),
                        ProfileOption(
                          iconAsset: SvgImagesManager.yourProductIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'Your products',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              PageRouteName.paymentRoute,
                            );
                          },
                        ),
                        ProfileOption(
                          isChangeLanguage: true,
                          assetPath: AssetsManager.englishToArabicIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'Change language',

                          onTap: () {
                            final currentLangCode =
                                context
                                    .read<AppControllerCubit>()
                                    .state
                                    .appLang
                                    .languageCode;

                            final newLang =
                                currentLangCode == 'ar'
                                    ? const Locale('en')
                                    : const Locale('ar');

                            context.read<AppControllerCubit>().changeLang(
                              newLang,
                            );
                          },
                        ),
                        ProfileOption(
                          iconAsset: SvgImagesManager.internetIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'Change country',
                        ),
                        ProfileOption(
                          iconAsset: SvgImagesManager.logoutIcon,
                          backgroundAsset: SvgImagesManager.boxIconProfile,
                          label: 'Log out',
                          onTap: () {
                            BlocProvider.of<AuthBloc>(
                              context,
                            ).add(LogoutEvent());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
