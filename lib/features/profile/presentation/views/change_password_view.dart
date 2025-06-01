import 'package:mubasher_app/features/profile/presentation/views/components/custom_change_password_field.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_event.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_state.dart';
import 'package:mubasher_app/features/profile/presentation/view_models/profile_bloc.dart';
import 'package:mubasher_app/features/profile/profile_cubit/change_password_cubit.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';
import 'package:mubasher_app/core/error/failure_type.dart';
import 'package:mubasher_app/core/di/di.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            cubit.clearFields();
            AppNotifier().showSuccess(
              context,
              context.lang.passwordChangedSuccessfullyText,
            );
            Navigator.pop(context);
          } else if (state is ChangePasswordFailure) {
            final errorMessage = switch (state.type) {
              FailureType.invalidOldPassword =>
                context.lang.oldPasswordIncorrectText,
              FailureType.invalidResponse =>
                context.lang.invalidResponseFromServerText,
              FailureType.serverConnectionError =>
                context.lang.serverConnectionErrorText,
              FailureType.unexpectedError => context.lang.unexpectedErrorText,
            };

            AppNotifier().showError(context, errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ChangePasswordLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Scaffold(
                  backgroundColor: ColorManager.white,
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ArrowBackLeadingAppbar(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  PageRouteName.profileOptionsRoute,
                                );
                              },
                            ),
                            SizedBox(height: 5.h),
                            TextSpanManager(
                              textAlign: TextAlign.start,
                              textOne: context.lang.changePasswordText,
                              fontSizeTextOne: 25.px,
                              fontWeightTextOne: FontWeight.w500,
                              colorTextOne: ColorManager.primaryColor,
                              latterSpaceTextOne: 0.5,
                              fontFamilyTextOne: "Inter",
                            ),
                            SizedBox(height: 4.h),
                            AppText(
                              text: context.lang.descriptionChangePasswordText,
                              fontFamily: 'Lato',
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 4.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.lang.oldPasswordText,
                                  fontFamily: "Raleway",
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomChangePasswordTextFormField(
                                  textEditingController:
                                      state.oldPasswordController,
                                  isShowContent: !state.showOld,
                                  hintText: context.lang.typeHereText,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .toggleOld();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.lang.newPasswordText,
                                  fontFamily: "Raleway",
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomChangePasswordTextFormField(
                                  textEditingController:
                                      state.newPasswordController,
                                  isShowContent: !state.showNew,
                                  hintText: context.lang.typeHereText,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .toggleNew();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.lang.confirmNewPasswordText,
                                  fontFamily: "Raleway",
                                  fontSize: 15.px,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomChangePasswordTextFormField(
                                  textEditingController:
                                      state.confirmPasswordController,
                                  isShowContent: !state.showConfirm,
                                  hintText: context.lang.typeHereText,
                                  onTap: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .toggleConfirm();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            ElevatedButtonManager(
                              text: context.lang.saveChangesText,
                              onPressed: () {
                                final oldPassword =
                                    cubit.state.oldPasswordController.text
                                        .trim();
                                final newPassword =
                                    cubit.state.newPasswordController.text
                                        .trim();
                                final confirmPassword =
                                    cubit.state.confirmPasswordController.text
                                        .trim();
                                if (formKey.currentState!.validate()) {
                                  if (oldPassword == newPassword) {
                                    AppNotifier().showError(
                                      context,
                                      context
                                          .lang
                                          .newPasswordDifferentFromOldText,
                                    );
                                    return;
                                  }

                                  if (newPassword != confirmPassword) {
                                    AppNotifier().showError(
                                      context,
                                      context
                                          .lang
                                          .confirmPasswordDifferentFromNewText,
                                    );
                                    return;
                                  }
                                  context.read<ProfileBloc>().add(
                                    SubmitChangePasswordEvent(
                                      oldPassword: oldPassword,
                                      newPassword: newPassword,
                                      confirmPassword: confirmPassword,
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
