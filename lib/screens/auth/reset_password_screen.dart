// lib/screens/auth/reset_password_screen.dart

import 'package:flutter/material.dart';
import 'package:gradprojectstorio/screens/auth/reset_password_success_screen.dart';
import 'package:gradprojectstorio/themes/app_colors.dart';
import 'package:gradprojectstorio/themes/app_styles.dart';
import 'package:gradprojectstorio/utils/constants.dart';
import 'package:gradprojectstorio/widgets/auth/custom_text_field.dart';
import 'package:gradprojectstorio/widgets/common/primary_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

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
              const Text('Set New Password', style: AppStyles.heading1),
              const SizedBox(height: kMediumVerticalSpace),
              Text(
                'Your verification was successful. Now create a new password for your account.',
                style: AppStyles.bodyText.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: kLargeVerticalSpace),

              const CustomTextField(hintText: 'New Password', isPassword: true),
              const CustomTextField(
                hintText: 'Confirm New Password',
                isPassword: true,
              ),
              const SizedBox(height: kMediumVerticalSpace),

              PrimaryButton(
                text: 'Change Password',
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(customPageRoute(const ResetPasswordSuccessScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
