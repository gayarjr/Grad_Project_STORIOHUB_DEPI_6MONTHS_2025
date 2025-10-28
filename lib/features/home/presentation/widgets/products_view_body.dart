import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/core/widgets/product_card.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: GridView.builder(
        itemCount: products.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
    );
  }
}
