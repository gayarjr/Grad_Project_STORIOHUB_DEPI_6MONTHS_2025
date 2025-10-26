import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/splash-onboarding/splash/presentation/pages/splash_page.dart';
import 'package:gradprojectstorio/features/splash-onboarding/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gradprojectstorio/features/create_account/presentation/pages/create_account.dart';

void main() {
  runApp(const Storio());
}

class Storio extends StatelessWidget {
  const Storio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storio',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        CreateAccountPage.routeName: (context) => const CreateAccountPage(),
      },
    );
  }
}
