import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comment', style: AppStyles.textSemiBold16),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'What do you think ?',
                  hintStyle: AppStyles.textRegular12.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            CustomButton(title: 'Send', newDesign: true),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          height: 162.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            'No comments yet, be the first to comment !',
            style: AppStyles.textRegular12.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
