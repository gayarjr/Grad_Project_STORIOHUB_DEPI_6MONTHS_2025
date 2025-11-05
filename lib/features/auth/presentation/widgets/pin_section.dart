import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:pinput/pinput.dart';

class PinSection extends StatelessWidget {
  const PinSection({super.key, this.onCompleted});

  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        separatorBuilder: (index) => SizedBox(width: 12.w),
        validator: (value) => value!.length == 4 ? null : 'Invalid OTP',
        length: 4,
        defaultPinTheme: PinTheme(
          width: 64.w,
          height: 64.h,
          textStyle: AppStyles.textBold24,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 64.w,
          height: 64.h,
          textStyle: AppStyles.textBold24,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onCompleted: onCompleted,
      ),
    );
  }
}
