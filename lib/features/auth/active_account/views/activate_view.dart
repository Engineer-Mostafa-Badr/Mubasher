import 'package:mubasher_app/core/custom_widget/app_text_form_field.dart';
import 'package:mubasher_app/features/auth/widgets/components/auth_export_file.dart';
import 'package:flutter_svg/svg.dart';

class ActivateView extends StatefulWidget {
  const ActivateView({super.key});

  @override
  State<ActivateView> createState() => _ActivateViewState();
}

class _ActivateViewState extends State<ActivateView> {
  String selectedMethod = 'E mail';

  final Map<dynamic, dynamic> methodIcons = {
    'E mail': SvgImagesManager.email,
    'Sms code': SvgImagesManager.phone,
    'Whatsapp code': SvgImagesManager.vector,
  };

  Widget _buildRadioTile(String label, String svgPath, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<String>(
              value: label,
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
              activeColor: Color(0xFFB38A43),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        AppTextFormField(
          textEditingController: TextEditingController(),
          color: ColorManager.primaryColor,
          hinText: hintText,
          isFill: true,
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $label';
            }
            return null;
          },
          prefix: SvgPicture.asset(
            svgPath,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(
              Color(0xFFB38A43),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
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
            AppText(text: context.lang.activeDescriptionText),
            SizedBox(height: 2.h),
            _buildRadioTile(
              context.lang.emailText,
              SvgImagesManager.email,
              context.lang.email,
            ),
            _buildRadioTile(
              context.lang.smsCodeText,
              SvgImagesManager.phone,
              context.lang.phoneNumberText,
            ),
            _buildRadioTile(
              context.lang.whatsappText,
              SvgImagesManager.vector,
              context.lang.whatsAppText,
            ),
            SizedBox(height: 2.h),
            AppText(
              text: context.lang.chooseMethodText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
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
                                    SvgPicture.asset(
                                      methodIcons[method]!,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFFB38A43),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      method,
                                      style: const TextStyle(fontSize: 16),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xF6F6F8FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      methodIcons[selectedMethod] ?? SvgImagesManager.email,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFB38A43),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      selectedMethod,
                      style: const TextStyle(
                        color: Color(0xFFB0B0C3),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 3.h),
            ElevatedButtonManager(
              text: context.lang.sendotpText,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  PageRouteName.enterOTPRoute,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
