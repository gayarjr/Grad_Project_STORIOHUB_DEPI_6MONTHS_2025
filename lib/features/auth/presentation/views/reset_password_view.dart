import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/auth_button.dart';
import 'package:gradprojectstorio/core/widgets/text_form_field_with_icon.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  void _resetPassword() {
    setState(() {});
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.green.shade50,
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green.shade600,
                    size: 40.r,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Password Changed!',
                  style: AppStyles.textBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Your can now use your new password to login to your account.',
                  textAlign: TextAlign.center,
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 24.h),
                AuthButton(
                  text: 'Login',
                  onTap: () {
                    // Pop dialog, then navigate back to login
                    Navigator.of(context).pop();
                    context.go(AppRoutes.login);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              'Reset Password',
              style: AppStyles.textBold24.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 8.h),
            Text(
              "Set the new password for your account so you can login and access all the features.",
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: 32.h),

            // New Password Field
            const TextFormFieldWithIcon(
              hintText: 'Enter new password',
              label: 'New Password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(height: 20.h),

            // Confirm Password Field
            const TextFormFieldWithIcon(
              hintText: 'Confirm new password',
              label: 'Confirm Password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(height: 40.h),

            // Continue Button
            AuthButton(text: 'Continue', onTap: _resetPassword),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
