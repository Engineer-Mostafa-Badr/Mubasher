import '../../core/resources/app_assets_manager.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        PageRouteName.signInRoute,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsManager.splashView, fit: BoxFit.cover);
  }
}
