// lib/screens/auth/verification_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/reset_password_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/auth/otp_input_field.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: kHorizontalPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Verify Email', style: AppStyles.heading1),
              const SizedBox(height: kMediumVerticalSpace),
              RichText(
                text: TextSpan(
                  style: AppStyles.bodyText.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  children: const [
                    TextSpan(text: 'Enter the 4-digit code sent to '),
                    TextSpan(
                      text: 'user@example.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kLargeVerticalSpace),

              // --- OTP Input Fields ---
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpInputField(first: true, last: false),
                  OtpInputField(first: false, last: false),
                  OtpInputField(first: false, last: false),
                  OtpInputField(first: false, last: true),
                ],
              ),
              const SizedBox(height: kLargeVerticalSpace),

              // --- Continue Button ---
              PrimaryButton(
                text: 'Verify and Continue',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(customPageRoute(const ResetPasswordScreen()));
                },
              ),
              const SizedBox(height: kMediumVerticalSpace),

              // --- Resend Code Link ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't receive a code?", style: AppStyles.bodyText),
                  TextButton(
                    onPressed: () {
                      // Handle resend code logic
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
