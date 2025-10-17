import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Name',
          style: AppStyles.textSemiBold16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text('\$50.00', style: AppStyles.textRegular16),
            Spacer(),
            Text(
              '(125)Reviews',
              style: AppStyles.textSemiBold10.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'Description',
          style: AppStyles.textRegular16,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
