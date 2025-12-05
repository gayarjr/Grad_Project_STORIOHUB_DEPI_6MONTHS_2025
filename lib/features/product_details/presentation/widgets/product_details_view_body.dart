import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/brand_section.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/button_and_price.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/descrption_section.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/header_product_details.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/select_sized_product.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/shipping_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderProductDetails(product: product),
            SizedBox(height: 24.h),
            SelectSizeProduct(),
            SizedBox(height: 24.h),
            DescriptionSection(product: product),
            SizedBox(height: 24.h),
            BrandSection(product: product),
            SizedBox(height: 24.h),
            ShippingSection(product: product),
            SizedBox(height: 16.h),
            ButtonAndPrice(product: product),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
