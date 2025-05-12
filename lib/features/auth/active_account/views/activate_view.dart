import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/domain/entities/user_entity.dart';

class ActivateView extends StatefulWidget {
  const ActivateView({super.key, required this.user});
  final UserEntity user;

  @override
  State<ActivateView> createState() => _ActivateViewState();
}

class _ActivateViewState extends State<ActivateView> {
  String? selectedMethod;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  final Map<String, String> methodIcons = {
    'E mail': SvgImagesManager.email,
    'Sms code': SvgImagesManager.phone,
    'Whatsapp code': SvgImagesManager.vector,
  };

  String _getHintForMethod(String label) {
    if (label == context.lang.emailText) return context.lang.email;
    if (label == context.lang.smsCodeText) return context.lang.phoneNumberText;
    if (label == context.lang.whatsappText) return context.lang.whatsAppText;
    return '';
  }

  Widget _buildRadioTile(String label, String svgPath, String hintText) {
    String? getUserField(String label) {
      if (label == context.lang.emailText) return widget.user.email;
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
    final isSelected = selectedMethod == label;

    String? getUserField(String label) {
      if (label == context.lang.emailText) return widget.user.email;
      if (label == context.lang.smsCodeText) return widget.user.phoneno;
      if (label == context.lang.whatsappText) return widget.user.whatsapp;
      return '';
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = label;
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
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PageRouteName.signUpRoute,
                );
              },
            ),
            SizedBox(height: 4.h),
            TextSpanManager(
              textAlign: TextAlign.start,
              textOne: context.lang.activeYourText,
              fontSizeTextOne: 25.px,
              fontWeightTextOne: FontWeight.w500,
              colorTextOne: ColorManager.primaryColor,
              latterSpaceTextOne: 0.5,
              fontFamilyTextOne: "Lato",
              textTwo: context.lang.accountText,
              fontSizeTextTwo: 25.px,
              fontWeightTextTwo: FontWeight.w800,
              colorTextTwo: ColorManager.black,
              fontFamilyTextTwo: "Lato",
              latterSpaceTextTwo: 0.5,
            ),
            SizedBox(height: 2.h),
            AppText(
              text: context.lang.activeDescriptionText,
              fontFamily: 'Lato',
              fontSize: 14.px,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 2.h),
            if (selectedMethod == null) ...[
              _buildSelectableRadioTile(
                context.lang.emailText,
                SvgImagesManager.email,
                context.lang.email,
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
            ] else ...[
              _buildRadioTile(
                selectedMethod!,
                methodIcons[selectedMethod]!,
                _getHintForMethod(selectedMethod!),
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
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.w),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            methodIcons.keys.map((method) {
                              return ListTile(
                                leading: Radio<String>(
                                  value: method,
                                  groupValue: selectedMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMethod = value!;
                                    });
                                    Navigator.pop(context);
                                  },
                                  activeColor: ColorManager.primaryColor,
                                ),
                                title: Row(
                                  children: [
                                    SvgPicture.asset(methodIcons[method]!),
                                    SizedBox(width: 2.w),
                                    AppText(
                                      fontSize: 14.px,
                                      text: method,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedMethod = method;
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: ColorManager.greyTextFormField,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      methodIcons[selectedMethod] ?? SvgImagesManager.email,
                    ),
                    SizedBox(width: 2.w),
                    AppText(
                      text: selectedMethod ?? context.lang.email,
                      textColor: ColorManager.greyLabelText,
                      fontSize: 14.px,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    SvgPicture.asset(SvgImagesManager.arrowDown),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            ElevatedButtonManager(
              text: context.lang.sendotpText,
              onPressed: () {
                if (selectedMethod != null) {
                  Navigator.pushReplacementNamed(
                    context,
                    PageRouteName.enterOTPRoute,
                    arguments: {'user': _textEditingController.text},
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
