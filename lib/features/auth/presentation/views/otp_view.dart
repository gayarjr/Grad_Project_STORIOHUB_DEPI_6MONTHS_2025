import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/auth_button.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatelessWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // You can use a controller here to set initial text if needed,
    // but we will keep it simple and remove the invalid 'PreFilledState' call.
    // final TextEditingController pinController = TextEditingController(text: '1420');

    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 60.h,
      textStyle: AppStyles.textBold24,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

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
              'Verification',
              style: AppStyles.textBold24.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter a 4 digit code that you receive on your email: $email",
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: 32.h),

            // OTP Input Field
            Center(
              child: Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                // controller: pinController, // Uncomment this line if you want to pre-fill it manually
                onCompleted: (pin) {},
              ),
            ),

            SizedBox(height: 40.h),

            // Continue Button
            AuthButton(
              text: 'Continue',
              onTap: () {
                // On successful OTP verification, navigate to Reset Password
                context.go(AppRoutes.resetPassword);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
