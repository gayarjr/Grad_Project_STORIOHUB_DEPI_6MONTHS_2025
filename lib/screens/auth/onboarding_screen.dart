import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/sign_up_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 120,
            child: Image.asset(
              'assets/images/onboarding_image.png',
              height: 627,
              width: 329,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              gaplessPlayback: true,
            ),
          ),

          Positioned(
            bottom: 10,
            left: 27,
            right: 27,
            child: Container(
              height: 70,
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: PrimaryButton(
                text: 'Get Started →',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacement(customPageRoute(const SignUpScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
