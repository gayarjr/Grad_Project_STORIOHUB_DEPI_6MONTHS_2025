import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/brand_card.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brand',
          style: AppStyles.textSemiBold20.copyWith(color: Colors.black87),
        ),
        SizedBox(height: 12.h),
        BrandCard(onTap: () {}, category: product.brand),
      ],
    );
  }
}
