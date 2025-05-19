import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_event.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_state.dart';
import 'package:mubasher_app/features/auth/presentation/view_models/auth_bloc.dart';
import 'dart:async';
import 'dart:ui';

class EnterOTPView extends StatefulWidget {
  const EnterOTPView({super.key, required this.email, required user});

  final String email;

  @override
  State<EnterOTPView> createState() => _EnterOTPViewState();
}

class _EnterOTPViewState extends State<EnterOTPView> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  bool _showSuccessBox = false;
  bool _otpSubmitted = false; // ✅ جديد
  int _secondsRemaining = 30;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsRemaining = 30;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          _canResend = true;
          timer.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  void _checkOTP() {
    final allFilled = _controllers.every(
      (controller) => controller.text.isNotEmpty,
    );
    if (!allFilled) return;

    final code = _controllers.map((e) => e.text).join();

    _otpSubmitted = true; // ✅ جديد

    context.read<AuthBloc>().add(
      ActivateAccountEvent(
        email: widget.email,
        phone: '',
        whatsapp: '',
        methodResponse: 'email',
        otp: code,
      ),
    );
  }

  void _onResendOTP() {
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes.first.requestFocus();
    _startCountdown();

    context.read<AuthBloc>().add(
      ResendOtpEvent(
        email: widget.email,
        phone: '',
        whatsapp: '',
        methodResponse: 'email',
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("خطأ"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("موافق"),
              ),
            ],
          ),
    );
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerified && _otpSubmitted) {
          setState(() {
            _showSuccessBox = true;
            _otpSubmitted = false; // ✅ إعادة ضبط
          });
          FocusScope.of(context).unfocus();
        } else if (state is OtpError) {
          _showErrorDialog(state.message);
        } else if (state is OtpResent) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("تم إرسال رمز جديد")));
        } else if (state is OtpResendError) {
          _showErrorDialog(state.message);
        }
      },
      child: Scaffold(
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
                  ArrowBackLeadingAppbar(onTap: () => Navigator.pop(context)),
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
                    text: widget.email,
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
                              borderSide: BorderSide.none,
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
                              _focusNodes[index + 1].requestFocus();
                            } else if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }

                            if (index == 3 && value.isNotEmpty) {
                              _checkOTP();
                            }
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
                                  _canResend
                                      ? context.lang.resendOTPText
                                      : '00:${_secondsRemaining.toString().padLeft(2, '0')}',
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
                    child: GestureDetector(
                      onTap: _canResend ? _onResendOTP : null,
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
                        colorTextTwo:
                            _canResend
                                ? ColorManager.black
                                : ColorManager.grey2,
                        fontFamilyTextTwo: "Releway",
                        latterSpaceTextTwo: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showSuccessBox) _buildSuccessBox(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessBox(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: ColorManager.black.withOpacity(0.5)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            height: 63.h,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(14.w)),
            ),
            child: Column(
              children: [
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
                SizedBox(height: 3.h),
                AppText(
                  textColor: const Color(0xFF3C4460),
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
    );
  }
}
