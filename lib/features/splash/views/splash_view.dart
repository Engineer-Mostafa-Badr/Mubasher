import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = await TokenStorageHelper.getToken();
    // ignore: avoid_print
    print("🔐 Token from splash: $token");
    if (!mounted) return;
    if (token != null && token.isNotEmpty) {
      // المستخدم مسجل دخول بالفعل
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, PageRouteName.homeRoute);
    } else {
      // المستخدم جديد أو مش مسجل دخول
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, PageRouteName.onBoardingOneRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsManager.splashView, fit: BoxFit.cover);
  }
}
