import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';
import 'package:mubasher_app/core/helpers/app_notifier.dart';

class ActivateView extends StatefulWidget {
  const ActivateView({super.key, required this.user});
  final UserEntity user;

  @override
  State<ActivateView> createState() => _ActivateViewState();
}

class _ActivateViewState extends State<ActivateView> {
  String? selectedSendMethod;
  String? selectedBindMethod;
  late TextEditingController _textEditingController;
  Map<String, String> methodIcons = {};

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    selectedBindMethod = 'Email';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        methodIcons = {
          context.lang.emailMethodText: SvgImagesManager.email,
          context.lang.smsCodeText: SvgImagesManager.phone,
          context.lang.whatsappText: SvgImagesManager.vector,
        };
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _getHintForMethod(String label) {
    if (label == context.lang.emailMethodText) return context.lang.emailText;
    if (label == context.lang.smsCodeText) return context.lang.phoneNumberText;
    if (label == context.lang.whatsappText) return context.lang.whatsAppText;
    return '';
  }

  Widget _buildRadioTile(String label, String svgPath, String hintText) {
    String? getUserField(String label) {
      if (label == context.lang.emailMethodText) return widget.user.email;
      if (label == context.lang.smsCodeText) return widget.user.phoneno;
      if (label == context.lang.whatsappText) return widget.user.whatsapp;
      return '';
    }

    _textEditingController.text = getUserField(label) ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              SvgImagesManager.chooseMethodIcon,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                ColorManager.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 1.w),
            AppText(
              fontSize: 14.px,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway',
              text: label,
              textColor: ColorManager.black,
            ),
          ],
        ),
        AppTextFormField(
          textEditingController: _textEditingController,
          hinText: hintText,
          isFill: true,
          prefix: SvgPicture.asset(svgPath, fit: BoxFit.scaleDown),
        ),
      ],
    );
  }

  Widget _buildSelectableRadioTile(
    String label,
    String svgPath,
    String hintText,
  ) {
    final isSelected = selectedSendMethod == label;

    String? getUserField(String label) {
      if (label == context.lang.emailMethodText) return widget.user.email;
      if (label == context.lang.smsCodeText) return widget.user.phoneno;
      if (label == context.lang.whatsappText) return widget.user.whatsapp;
      return '';
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSendMethod = label;
          _textEditingController.text = getUserField(label) ?? '';
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SvgImagesManager.chooseMethodIcon,
                fit: BoxFit.scaleDown,
                colorFilter:
                    isSelected
                        ? const ColorFilter.mode(
                          ColorManager.primaryColor,
                          BlendMode.srcIn,
                        )
                        : null,
              ),
              SizedBox(width: 1.w),
              AppText(
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway',
                fontSize: 14.px,
                text: label,
              ),
            ],
          ),
          AppTextFormField(
            textEditingController: _textEditingController,
            hinText: hintText,
            isFill: true,
            prefix: SvgPicture.asset(svgPath, fit: BoxFit.scaleDown),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            ArrowBackLeadingAppbar(
              onTap:
                  () => Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.profileOptionsRoute,
                  ),
            ),
            SizedBox(height: 4.h),
            TextSpanManager(
              textAlign: TextAlign.start,
              textOne: context.lang.changePasswordText,
              fontSizeTextOne: 25.px,
              fontWeightTextOne: FontWeight.w500,
              colorTextOne: ColorManager.primaryColor,
              latterSpaceTextOne: 0.5,
              fontFamilyTextOne: "Inter",
            ),
            SizedBox(height: 2.h),
            AppText(
              text: context.lang.activeDescriptionText,
              fontFamily: 'Lato',
              fontSize: 14.px,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 2.h),

            if (selectedSendMethod == null) ...[
              _buildSelectableRadioTile(
                context.lang.emailMethodText,
                SvgImagesManager.email,
                context.lang.emailText,
              ),
              SizedBox(height: 2.h),
              _buildSelectableRadioTile(
                context.lang.smsCodeText,
                SvgImagesManager.phone,
                context.lang.phoneNumberText,
              ),
              SizedBox(height: 2.h),
              _buildSelectableRadioTile(
                context.lang.whatsappText,
                SvgImagesManager.vector,
                context.lang.whatsAppText,
              ),
            ] else if (methodIcons.containsKey(selectedSendMethod)) ...[
              _buildRadioTile(
                selectedSendMethod!,
                methodIcons[selectedSendMethod!]!,
                _getHintForMethod(selectedSendMethod!),
              ),
            ] else ...[
              AppText(
                text: 'حدث خطأ في اختيار الوسيلة',
                textColor: ColorManager.red,
              ),
            ],

            SizedBox(height: 3.h),

            AppText(
              text: context.lang.chooseMethodText,
              fontSize: 14.px,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 1.h),

            Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: ColorManager.greyTextFormField),
              child: DropdownButtonFormField<String>(
                value: selectedBindMethod,
                borderRadius: BorderRadius.circular(6.w),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorManager.greyTextFormField,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 3.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                ),
                icon: const Icon(Icons.arrow_drop_down),
                items:
                    ['Email', 'Phone', 'WhatsApp'].map((method) {
                      String iconPath =
                          method == 'Email'
                              ? SvgImagesManager.email
                              : method == 'Phone'
                              ? SvgImagesManager.phone
                              : SvgImagesManager.vector;
                      return DropdownMenuItem<String>(
                        value: method,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              iconPath,
                              height: 2.h,
                              width: 6.w,
                              colorFilter: const ColorFilter.mode(
                                ColorManager.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            AppText(
                              text: method,
                              fontSize: 14.px,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged:
                    (value) => setState(() => selectedBindMethod = value),
              ),
            ),

            SizedBox(height: 5.h),

            ElevatedButtonManager(
              text: context.lang.sendotpText,
              onPressed: () {
                if (selectedSendMethod != null && selectedBindMethod != null) {
                  String email = '', phone = '', whatsapp = '';

                  if (selectedSendMethod == context.lang.emailMethodText) {
                    email = widget.user.email;
                  } else if (selectedSendMethod == context.lang.smsCodeText) {
                    phone = widget.user.phoneno;
                  } else if (selectedSendMethod == context.lang.whatsappText) {
                    whatsapp = widget.user.whatsapp;
                  }

                  final method = selectedSendMethod!;
                  String sendTo =
                      method == context.lang.emailMethodText
                          ? email
                          : method == context.lang.smsCodeText
                          ? phone
                          : whatsapp;

                  context.read<AuthBloc>().add(
                    ActivateAccountEvent(
                      email: email,
                      phone: phone,
                      whatsapp: whatsapp,
                      methodResponse: method,
                      otp: '',
                    ),
                  );

                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.enterOTPRoute,
                    arguments: {
                      'user': sendTo,
                      'bindMethod': selectedBindMethod,
                      'sendMethod': selectedSendMethod,
                      'email': email,
                      'phone': phone,
                      'whatsapp': whatsapp,
                    },
                  );
                } else {
                  AppNotifier().showError(
                    context,
                    'يرجى اختيار وسيلة الإرسال وطريقة ربط الحساب',
                  );
                }
              },
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
