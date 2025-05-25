import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class OutlineButtonManager extends StatelessWidget {
  const OutlineButtonManager({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            foregroundColor: ColorManager.primaryColor,
            side: BorderSide(color: ColorManager.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.w),
            ),
          ),
          onPressed: () {
            context.read<AuthBloc>().add(ContinueWithoutLoginEvent());

            Navigator.pushNamed(context, PageRouteName.homeRoute);
          },
          child: AppText(
            text: context.lang.endTextLoginText,
            fontWeight: FontWeight.w700,
            fontSize: 18.px,
            fontFamily: "Lato",
            textColor: ColorManager.primaryColor,
          ),
        ),
      ),
    );
  }
}
