// lib/screens/auth/reset_password_success_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/login_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  const ResetPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.success.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: AppColors.success,
                size: 80,
              ),
            ),
            const SizedBox(height: kLargeVerticalSpace),
            const Text('Password Changed!', style: AppStyles.heading1),
            const SizedBox(height: kMediumVerticalSpace),
            Text(
              'Your password has been updated successfully. You can now use your new password to log in.',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: kLargeVerticalSpace * 2),
            PrimaryButton(
              text: 'Go to Login',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  customPageRoute(const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
