import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';

class changePassword extends StatelessWidget {
  const changePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      PasswordField(
                        labelText: "Current Password",
                        hintText: 'Enter your current password',
                      ),
                      SizedBox(height: 16.h),
                      PasswordField(
                        labelText: "New Password",
                        hintText: 'Enter your new password',
                      ),
                      SizedBox(height: 16.h),
                      PasswordField(
                        labelText: "Confirm New Password",
                        hintText: 'Re-enter your new password',
                      ),
                      SizedBox(height: 350.h),
                      CustomButton(text: 'Submit', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
