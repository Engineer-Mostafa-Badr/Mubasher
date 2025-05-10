import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return AppTextFormField(
          keyboardType: TextInputType.emailAddress,
          textEditingController: state.emailController,
          hinText: context.lang.email,
          labelText: context.lang.email,
          colorHintText: ColorManager.grey,
          validate:
              (email) => context.read<RegistrationCubit>().validateEmail(
                context: context,
                email: email,
              ),
          prefix: SvgPicture.asset(
            SvgImagesManager.email,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorManager.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
