import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gradprojectstorio/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Onboarding
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding1');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Upper circular border decoration
          Positioned(
            top: size.height * 0.06,
            left: -size.width * 0.35,
            child: Container(
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 22,
                ),
              ),
            ),
          ),

          // Lower circular border decoration
          Positioned(
            bottom: -size.width * 0.2,
            right: -size.width * 0.15,
            child: Container(
              width: size.width * 0.55,
              height: size.width * 0.55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 18,
                ),
              ),
            ),
          ),

          // Centered logo, reflection, and tagline
          Center(
            child: Transform.translate(
              offset: const Offset(0, 40), // Adjust vertical position of the group
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Innova",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      fontSize: 60,
                      color: Colors.white,
                      height: 0.5,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Opacity(
                    opacity: 0.1,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi), // Vertical reflection effect
                      child: const Text(
                        "Innova",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          fontSize: 60,
                          color: Colors.white,
                          height: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Start your journey now",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.3,
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
