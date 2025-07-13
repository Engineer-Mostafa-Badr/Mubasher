import 'package:mubasher_app/features/profile/presentation/views/components/custom_details_profile.dart';
import 'package:mubasher_app/features/profile/presentation/views/components/custom_profile_options.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/config/app_controller/cubit/app_controller_cubit.dart';
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
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bool isContinueWithoutSignIn = state is AuthGuestState;
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: SafeArea(
              child: Column(
                children: [
                  CustomDetailsProfile(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteName.homeUserRoute,
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
                          childAspectRatio: 0.70,
                          children: [
                            ProfileOption(
                              iconAsset: SvgImagesManager.showOutlineIcon,
                              backgroundAsset: SvgImagesManager.boxIconProfile,
                              label: context.lang.showProfileText,
                              onTap: () {
                                final state = context.read<AuthBloc>().state;
                                if (state is AuthLoaded) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    PageRouteName.editProfileRoute,
                                    arguments: state.user,
                                  );
                                } else {
                                  AppNotifier().showError(
                                    context,
                                    context.lang.pleaseLogInFirstText,
                                  );
                                }
                              },
                            ),
                            ProfileOption(
                              iconAsset: SvgImagesManager.editFilledIcon,
                              backgroundAsset: SvgImagesManager.boxIconProfile,
                              label: context.lang.aboutUsText,
                            ),
                            ProfileOption(
                              iconAsset: SvgImagesManager.yourProductIcon,
                              backgroundAsset: SvgImagesManager.boxIconProfile,
                              label: context.lang.yourProductText,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  PageRouteName.stateRoute,
                                );
                              },
                            ),

                            ProfileOption(
                              isChangeLanguage: true,
                              assetPath: AssetsManager.englishToArabicIcon,
                              backgroundAsset: SvgImagesManager.boxIconProfile,
                              label: context.lang.changeLanguageText,

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
                              label: context.lang.changeCountryText,
                            ),
                            isContinueWithoutSignIn
                                ? ProfileOption(
                                  iconAsset: SvgImagesManager.arrowLeftIcon,
                                  backgroundAsset:
                                      SvgImagesManager.boxIconProfile,
                                  label: context.lang.loginText,
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      PageRouteName.signInRoute,
                                    );
                                  },
                                )
                                : ProfileOption(
                                  iconAsset: SvgImagesManager.logoutIcon,
                                  backgroundAsset:
                                      SvgImagesManager.boxIconProfile,
                                  label: context.lang.logOutText,
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
          );
        },
      ),
    );
  }
}
