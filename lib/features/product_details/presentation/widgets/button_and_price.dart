import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

class ButtonAndPrice extends StatelessWidget {
  const ButtonAndPrice({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: AppStyles.textSemiBold16,
            ),
          ],
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: CustomButton(text: 'Add to Cart', onPressed: () {}),
        ),
      ],
    );
  }
}
