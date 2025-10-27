import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "Or",
                style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 24.h),
        SocialButton(
          text: "Sign Up with Google",
          iconPath: AppAssets.iconsLogosGoogleIcon,
          borderColor: AppColors.grey,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        SocialButton(
          text: "Sign Up with Facebook",
          iconPath: AppAssets.iconsLogosFacebook,
          backgroundColor: AppColors.facebookColor,
          textColor: AppColors.white,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
