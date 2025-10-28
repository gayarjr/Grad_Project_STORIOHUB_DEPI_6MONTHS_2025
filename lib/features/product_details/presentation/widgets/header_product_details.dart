import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/product_image_slider.dart';

class HeaderProductDetails extends StatelessWidget {
  const HeaderProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageSlider(images: product.images),
        SizedBox(height: 12.h),
        Text(product.title, style: AppStyles.textSemiBold24),
        SizedBox(height: 12.h),
        Row(
          spacing: 4.w,
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 18.sp),
            Text(
              '${product.rating}/5',
              style: AppStyles.textMedium16.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              '(${product.ratingCount} reviews)',
              style: AppStyles.textMedium16.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
