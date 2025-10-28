import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.2,
            ),
          ),
        ),
        icon: Image.asset(iconPath, height: 24, width: 24),
        label: Text(
          text,
          style: AppStyles.textMedium16.copyWith(color: textColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
