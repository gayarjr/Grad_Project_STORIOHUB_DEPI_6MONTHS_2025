import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, this.onTap});

  final CategoryEntity category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: CachedNetworkImage(
                  imageUrl: category.image,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Skeletonizer(
                    enabled: true,
                    child: Image.asset(AppAssets.imagesTestC),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.imagesTestC),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(category.name, style: AppStyles.textRegular12),
        ],
      ),
    );
  }
}
