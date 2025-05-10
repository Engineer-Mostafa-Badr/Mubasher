import 'package:mubasher_app/core/helpers/token_storage_helper.dart';
import 'package:mubasher_app/core/resources/app_assets_manager.dart';
import 'package:mubasher_app/core/route/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showFullSplash = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.3,
      end: 1.8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showFullSplash = true;
      });
    });

    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await TokenStorageHelper.getToken();
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, PageRouteName.activateRoute);
    } else {
      Navigator.pushReplacementNamed(context, PageRouteName.onBoardingOneRoute);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (!showFullSplash)
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: SvgPicture.asset(
                  SvgImagesManager.group21,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          if (showFullSplash)
            Image.asset(
              AssetsManager.splashView,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
        ],
      ),
    );
  }
}
