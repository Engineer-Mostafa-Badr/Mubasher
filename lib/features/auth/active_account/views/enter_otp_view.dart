import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'dart:async';
import 'dart:ui';

class EnterOTPView extends StatefulWidget {
  const EnterOTPView({super.key, required this.user});
  final String user;

  @override
  State<EnterOTPView> createState() => _EnterOTPViewState();
}

class _EnterOTPViewState extends State<EnterOTPView> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _showSuccessBox = false;
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _checkOTP() {
    bool allFilled = _controllers.every(
      (controller) => controller.text.isNotEmpty,
    );
    if (allFilled) {
      setState(() {
        _showSuccessBox = true;
      });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                ArrowBackLeadingAppbar(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PageRouteName.activateRoute,
                    );
                  },
                ),
                SizedBox(height: 5.h),
                TextSpanManager(
                  textAlign: TextAlign.start,
                  textOne: context.lang.enterTheText,
                  fontSizeTextOne: 25.px,
                  fontWeightTextOne: FontWeight.w400,
                  colorTextOne: ColorManager.primaryColor,
                  latterSpaceTextOne: 0.5,
                  fontFamilyTextOne: "Lato",
                  textTwo: context.lang.codeText,
                  fontSizeTextTwo: 25.px,
                  fontWeightTextTwo: FontWeight.w900,
                  colorTextTwo: ColorManager.black,
                  fontFamilyTextTwo: "Lato",
                  latterSpaceTextTwo: 0.5,
                ),
                SizedBox(height: 3.h),
                AppText(
                  fontSize: 14.px,
                  fontWeight: FontWeight.w400,
                  text: context.lang.descriptionEnterViewText,
                ),
                AppText(
                  textColor: ColorManager.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  text: widget.user,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 20.w,
                      height: 10.h,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 24,
                          color: ColorManager.primaryColor,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: ColorManager.greyTextFormField,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.w),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                            borderSide: const BorderSide(
                              color: ColorManager.black,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(
                              context,
                            ).requestFocus(_focusNodes[index + 1]);
                          }
                          _checkOTP();
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.w),
                    child: Container(
                      height: 6.h,
                      width: 22.w,
                      color: ColorManager.greyTextFormField,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgImagesManager.timer,
                            fit: BoxFit.scaleDown,
                            width: 2.w,
                            height: 3.5.h,
                          ),
                          AppText(
                            text:
                                '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                            fontFamily: 'Mantserrat',
                            fontSize: 14.px,
                            fontWeight: FontWeight.w500,
                            textColor: ColorManager.primaryColor,
                            latterSpace: .5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Center(
                  child: TextSpanManager(
                    textAlign: TextAlign.start,
                    textOne: context.lang.didnotReceiveTheOTPText,
                    fontSizeTextOne: 12.px,
                    fontWeightTextOne: FontWeight.w400,
                    colorTextOne: ColorManager.grey2,
                    latterSpaceTextOne: 0.5,
                    fontFamilyTextOne: "Releway",
                    textTwo: context.lang.resendOTPText,
                    fontSizeTextTwo: 12.px,
                    fontWeightTextTwo: FontWeight.w700,
                    colorTextTwo: ColorManager.black,
                    fontFamilyTextTwo: "Releway",
                    latterSpaceTextTwo: 0.5,
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccessBox)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                // ignore: deprecated_member_use
                color: ColorManager.black.withOpacity(0.5),
              ),
            ),
          if (_showSuccessBox)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                height: 63.h,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.w),
                    topRight: Radius.circular(14.w),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5),
                    Container(
                      width: 15.w,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3C4460),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SvgPicture.asset(
                      SvgImagesManager.alertSuccess,
                      width: 5.w,
                      height: 20.h,
                    ),
                    SizedBox(height: 2.h),
                    Column(
                      children: [
                        TextSpanManager(
                          textAlign: TextAlign.start,
                          textOne: context.lang.accountEnterCodeText,
                          fontSizeTextOne: 25.px,
                          fontWeightTextOne: FontWeight.w500,
                          colorTextOne: ColorManager.black,
                          latterSpaceTextOne: 0.5,
                          fontFamilyTextOne: "Releway",
                          textTwo: context.lang.successfullyText,
                          fontSizeTextTwo: 25.px,
                          fontWeightTextTwo: FontWeight.w600,
                          colorTextTwo: ColorManager.primaryColor,
                          fontFamilyTextTwo: "Releway",
                          latterSpaceTextTwo: 0.5,
                        ),
                        AppText(
                          text: context.lang.createdText,
                          fontWeight: FontWeight.w400,
                          fontSize: 25.px,
                          fontFamily: "Releway",
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    AppText(
                      textColor: Color(0xFF3C4460),
                      fontSize: 14,
                      text: context.lang.descriptionEnterCodeText,
                    ),
                    SizedBox(height: 3.h),
                    ElevatedButtonManager(
                      text: context.lang.finishText,
                      color: ColorManager.primaryColor,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          PageRouteName.homeRoute,
                          ModalRoute.withName(PageRouteName.splashRoute),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
