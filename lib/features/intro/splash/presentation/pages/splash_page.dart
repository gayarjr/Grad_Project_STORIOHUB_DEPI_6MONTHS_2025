// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

import '../../../../../core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await Prefs.getToken();

    if (token != null && token.isNotEmpty) {
      context.go(AppRoutes.main);
    } else {
      context.go(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.imagesSplashBg, fit: BoxFit.cover),
          ),
          Center(
            child: Image.asset(
              AppAssets.imagesLogo,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
