// lib/screens/auth/sign_up_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/login_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/auth/custom_text_field.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              const Text('Create Your Account', style: AppStyles.heading1),
              const SizedBox(height: kMediumVerticalSpace),

              // --- Form Fields ---
              const CustomTextField(hintText: 'Full Name'),
              const CustomTextField(
                hintText: 'Email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const CustomTextField(hintText: 'Password', isPassword: true),

              // --- Terms and Conditions ---
              Padding(
                padding: const EdgeInsets.only(bottom: kMediumVerticalSpace),
                child: Text(
                  'By signing up you agree to our Terms, Privacy Policy, and Cookie Policy.',
                  style: AppStyles.secondaryText.copyWith(fontSize: 12),
                ),
              ),

              // --- Create Account Button ---
              PrimaryButton(text: 'Create Account', onPressed: () {}),
              const SizedBox(height: kLargeVerticalSpace),

              // --- Divider with 'or' ---
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.inputBorder)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR', style: AppStyles.secondaryText),
                  ),
                  Expanded(child: Divider(color: AppColors.inputBorder)),
                ],
              ),
              const SizedBox(height: kLargeVerticalSpace),

              // --- Social Sign Up Buttons ---
              PrimaryButton(
                text: 'Continue with Google',
                onPressed: () {},
                isSecondary: true,
              ),
              const SizedBox(height: kSmallVerticalSpace),
              PrimaryButton(
                text: 'Continue with Facebook',
                onPressed: () {},
                isSecondary: true,
              ),

              const SizedBox(height: kLargeVerticalSpace * 1.5),

              // --- Login Link ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: AppStyles.bodyText),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(customPageRoute(const LoginScreen()));
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kMediumVerticalSpace),
            ],
          ),
        ),
      ),
    );
  }
}
