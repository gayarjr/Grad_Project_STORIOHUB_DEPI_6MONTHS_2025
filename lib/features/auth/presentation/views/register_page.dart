import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/core/widgets/password_field.dart';
import '../../../../core/widgets/custom_text_field_with_label.dart';
import '../widgets/social_buttons_row.dart';
import '../widgets/not_or_have_account_text.dart';
import '../../../../core/functions/validators.dart';
import '../widgets/terms_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text("Create an Account", style: AppStyles.textSemiBold32),
                SizedBox(height: 12.h),
                Text(
                  "Let’s create your account.",
                  style: AppStyles.textRegular16.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFieldWithLabel(
                  label: "Full Name",
                  hint: "Enter your full name",
                  keyboardType: TextInputType.text,
                  validator: Validators.name,
                ),
                SizedBox(height: 16.h),
                CustomTextFieldWithLabel(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  hint: "Enter your email address",
                  validator: Validators.email,
                ),
                SizedBox(height: 16.h),
                CustomTextFieldWithLabel(
                  keyboardType: TextInputType.phone,
                  label: "Phone",
                  hint: "Enter your phone",
                  validator: Validators.phone,
                ),
                SizedBox(height: 16.h),
                PasswordField(
                  labelText: "Password",
                  hintText: 'Enter your password',
                ),
                SizedBox(height: 12.h),
                const TermsText(),
                SizedBox(height: 24.h),
                CustomButton(text: 'Create an Account', onPressed: () {}),
                SizedBox(height: 24),
                const SocialButtonsRow(),
                SizedBox(height: 20),
                NotOrHaveAccountText(
                  text: "Already have an account? ",
                  buttonText: "Log In",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
