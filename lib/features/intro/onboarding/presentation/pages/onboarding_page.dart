import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  static const String routeName = '/onboarding';

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                AppAssets.imagesOnbprding,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomButton(
                text: "Get Started",
                icon: Icons.arrow_forward,
                onPressed: () {
                  GoRouter.of(context).go(AppRoutes.login);
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
