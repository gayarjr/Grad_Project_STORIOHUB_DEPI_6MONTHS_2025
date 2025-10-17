import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/add_cart_and_quantity.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/comment_section.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/image_section.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/owner_info.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/product_info.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://picsum.photos/400/300?1',
      'https://picsum.photos/400/300?2',
      'https://picsum.photos/400/300?3',
      'https://picsum.photos/400/300?4',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(images: images),
            SizedBox(height: 24.h),
            OwnerInfo(),
            SizedBox(height: 16.h),
            ProductInfo(),
            SizedBox(height: 24.h),
            AddToCardAndQuantity(),
            SizedBox(height: 24.h),
            CommentSection(),
          ],
        ),
      ),
    );
  }
}
