import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/text_form_field_with_icon.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/auth_button.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/social_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your account',
              style: AppStyles.textBold24.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8.h),
            Text(
              "It's great to see you again",
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: 32.h),

            // Email Field
            const TextFormFieldWithIcon(
              hintText: 'Enter your email address',
              label: 'Email',
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 20.h),

            // Password Field
            const TextFormFieldWithIcon(
              hintText: 'Enter your password',
              label: 'Password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(height: 12.h),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.forgetPassword),
                child: Text(
                  'Forgot your password? Reset your password',
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Login Button
            AuthButton(
              text: 'Login',
              onTap: () {
                context.go(AppRoutes.main);
              },
            ),
            SizedBox(height: 20.h),

            // OR Divider
            Center(
              child: Text(
                'OR',
                style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
              ),
            ),
            SizedBox(height: 20.h),

            // Social Buttons
            SocialButton(
              text: 'Login with Google',
              iconPath:
                  'assets/images/google_icon.png', // Corrected parameter name
              onPressed: () {
                /* TODO: Google login logic */
              }, // Added required callback
            ),
            SizedBox(height: 16.h),
            SocialButton(
              text: 'Login with Facebook',
              iconPath:
                  'assets/images/facebook_icon.png', // Corrected parameter name
              onPressed: () {}, // Added required callback
              backgroundColor: AppColors.facebookColor,
              textColor: AppColors.white,
            ),
            SizedBox(height: 40.h),

            // Don't have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go(AppRoutes.register),
                  child: Text(
                    ' Join',
                    style: AppStyles.textBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
