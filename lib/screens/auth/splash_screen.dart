// lib/screens/auth/splash_screen.dart (UPDATED CODE)

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/onboarding_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(
        context,
      ).pushReplacement(customPageRoute(const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/wave_pattern.png',
              fit: BoxFit.cover,
              height: 627,
              width: 329,
              alignment: Alignment.topCenter,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Image.asset(
                  'assets/images/plus_logo.png',
                  width: 133,
                  height: 133,
                ),

                const Spacer(flex: 2),
                CircularProgressIndicator(color: AppColors.background),
                const SizedBox(height: kLargeVerticalSpace * 1.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
