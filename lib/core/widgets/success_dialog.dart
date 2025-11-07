import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const SuccessDialog({
    super.key,
    required this.onDismiss,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.imagesCheckDone, width: 74, height: 74),
            SizedBox(height: 12.h),
            Text('Congratulations!', style: AppStyles.textSemiBold20),
            SizedBox(height: 8.h),
            Text(
              message,
              style: AppStyles.textRegular16.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            CustomButton(text: 'Thanks', onPressed: onDismiss),
          ],
        ),
      ),
    );
  }
}
