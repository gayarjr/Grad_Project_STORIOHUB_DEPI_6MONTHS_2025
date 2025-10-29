import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/auth_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder email for illustration as in the image
    const String placeholderEmail = 'cody.fisher45@example.com';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot password',
              style: AppStyles.textBold24.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter your email for the verification process. We will send 4 digits code to your email",
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: 32.h),

            // Email Label
            Text(
              'Email',
              style: AppStyles.textRegular16.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8.h),

            // Display Email (as seen in the image)
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                placeholderEmail,
                style: AppStyles.textRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // Send Code Button
            AuthButton(
              text: 'Send Code',
              onTap: () {
                // TODO: Implement API call to send code
                // On success, navigate to OTP verification screen
                context.pushNamed(AppRoutes.otp, extra: placeholderEmail);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
