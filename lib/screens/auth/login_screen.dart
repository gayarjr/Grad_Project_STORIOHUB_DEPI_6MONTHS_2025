// lib/screens/auth/login_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/forgot_password_screen.dart';
import 'package:gradprojectstorio/screens/auth/sign_up_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/auth/custom_text_field.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: kMediumVerticalSpace),
              const Text('Welcome Back', style: AppStyles.heading1),
              const SizedBox(height: kSmallVerticalSpace),
              Text(
                "Sign in to continue your journey.",
                style: AppStyles.secondaryText,
              ),
              const SizedBox(height: kLargeVerticalSpace),

              const CustomTextField(
                hintText: 'Email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const CustomTextField(hintText: 'Password', isPassword: true),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(customPageRoute(const ForgotPasswordScreen()));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: kSmallVerticalSpace),

              PrimaryButton(text: 'Login', onPressed: () {}),
              const SizedBox(height: kLargeVerticalSpace),

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

              PrimaryButton(
                text: 'Continue with Google',
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: kSmallVerticalSpace),
              PrimaryButton(
                text: 'Continue with Facebook',
                onPressed: () {},
                isOutline: true,
              ),

              const SizedBox(height: kLargeVerticalSpace * 1.5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: AppStyles.bodyText),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(customPageRoute(const SignUpScreen()));
                    },
                    child: const Text(
                      'Sign Up',
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
