import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';

class TotalAndButton extends StatelessWidget {
  const TotalAndButton({
    super.key,
    required this.total,
    required this.onTap,
    required this.buttonText,
  });

  final String total;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppStyles.textRegular16),
              Text('\$$total', style: AppStyles.textSemiBold16),
            ],
          ),
          SizedBox(height: 16.h),
          CustomButton(text: buttonText, onPressed: onTap),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
