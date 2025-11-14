import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/widgets/product_card.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingNewArrivals extends StatelessWidget {
  const LoadingNewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          TitleAndSeeAll(title: 'New Arrivals', onTap: () {}),
          SizedBox(height: 12.h),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: ProductCard(
                  product: ProductEntity(
                    id: '',
                    title: '',
                    description: '',
                    price: 0,
                    imageCover: '',
                    images: [],
                    ratingsAverage: 0,
                    ratingsQuantity: 0,
                    brand: CategoryEntity(id: '', name: '', image: ''),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
