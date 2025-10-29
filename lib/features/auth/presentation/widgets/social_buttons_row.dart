import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/auth/presentation/widgets/social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          text: 'Login with Google',
          iconPath: 'assets/images/google_icon.png',
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        SocialButton(
          text: 'Login with Facebook',
          iconPath: 'assets/images/facebook_icon.png',
          onPressed: () {},
          textColor: AppColors.facebookColor,
        ),
      ],
    );
  }
}
