import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class EnterOTPView extends StatefulWidget {
  const EnterOTPView({super.key});

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
      // إخفاء لوحة المفاتيح بعد إدخال الأرقام الأربعة
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
      backgroundColor: const Color(0xFFF8F8F8),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFFB98A38),
                  ),
                ),
                const SizedBox(height: 20),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Enter the ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFB98A38),
                        ),
                      ),
                      TextSpan(
                        text: "code",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter the 4 digit code that we just sent to",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "jonathan@email.com",
                  style: TextStyle(color: Color(0xFFB98A38), fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "$_secondsRemaining s",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 60,
                      height: 70,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFFB98A38),
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: const Color(0xFFF7F5F9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black),
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
                const SizedBox(height: 60),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Didn’t receive the OTP? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Resend OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB98A38),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccessBox)
            Opacity(opacity: 0.6, child: Container(color: Colors.black)),
          if (_showSuccessBox)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3C4460),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF375C4A), Color(0xFF78BF34)],
                        ),
                      ),
                      padding: const EdgeInsets.all(30),
                      child: const Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Account ",
                            style: TextStyle(fontSize: 26),
                          ),
                          TextSpan(
                            text: "successfully\n",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB98A38),
                            ),
                          ),
                          TextSpan(
                            text: "created",
                            style: TextStyle(fontSize: 26),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur.",
                      style: TextStyle(color: Color(0xFF3C4460), fontSize: 14),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB98A38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteName.homeRoute,
                        );
                      },
                      child: const Text(
                        "Finish",
                        style: TextStyle(color: Colors.white),
                      ),
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
