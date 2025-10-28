import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppStyles.textSemiBold20),
        SizedBox(height: 12.h),
        Text(
          product.description,
          style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
