import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/functions/validators.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/custom_text_field_with_label.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              Text('Forgot password', style: AppStyles.textSemiBold32),
              SizedBox(height: 8.h),
              Text(
                "Enter your email for the verification process. We will send 4 digits code to your email",
                style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
              ),
              SizedBox(height: 12.h),
              CustomTextFieldWithLabel(
                label: 'Email',
                hint: 'Enter your email',
                validator: Validators.email,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(height: 32.h),
              CustomButton(
                text: 'Send Code',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.push(AppRoutes.otp, extra: _emailController.text);
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
