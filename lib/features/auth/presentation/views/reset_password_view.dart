import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _passController, _confirmPassController;

  @override
  void initState() {
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reset Password', style: AppStyles.textSemiBold32),
              SizedBox(height: 8.h),
              Text(
                "Set the new password for your account so you can login and access all the features.",
                style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
              ),
              SizedBox(height: 24.h),
              PasswordField(
                labelText: "New Password",
                hintText: 'Enter your new password',
                controller: _passController,
                validator: Validators.password,
              ),
              SizedBox(height: 16.h),
              PasswordField(
                controller: _confirmPassController,
                labelText: "Confirm Password",
                hintText: 'Confirm your password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    customSnackBar(
                      context,
                      message: 'Password reset successfully',
                      type: AnimatedSnackBarType.success,
                    );
                    formKey.currentState!.save();
                    context.go(AppRoutes.login);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
