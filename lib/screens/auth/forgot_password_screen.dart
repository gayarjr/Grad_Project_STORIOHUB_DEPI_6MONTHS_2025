import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/verification_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/auth/custom_text_field.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
              const Text('Forgot Password?', style: AppStyles.heading1),
              const SizedBox(height: kMediumVerticalSpace),
              Text(
                'Enter the email you registered with. We will send a verification code to reset your password.',
                style: AppStyles.bodyText.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: kLargeVerticalSpace),

              // --- Email Field ---
              const CustomTextField(
                hintText: 'Email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: kLargeVerticalSpace),

              // --- Send Code Button ---
              PrimaryButton(
                text: 'Send Code',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(customPageRoute(const VerificationScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
