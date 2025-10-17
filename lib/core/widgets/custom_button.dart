import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.newDesign,
  });

  final String title;

  final VoidCallback? onTap;
  final bool? newDesign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            newDesign == true ? AppColors.primaryColor : AppColors.white,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.textRegular16.copyWith(
            color: newDesign == true ? AppColors.white : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
