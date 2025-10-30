/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/icon_fav_buttom.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.productDetails, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: product.imageCover,
                  fit: BoxFit.fill,
                  height: 180.h,
                  width: double.infinity,
                  placeholder: (context, url) => Skeletonizer(
                    enabled: true,
                    child: Image.asset(AppAssets.imagesTestC, height: 180.h),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.imagesTestC, height: 180.h),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: IconFavButtom(product: product),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textSemiBold16,
          ),
          SizedBox(height: 4.h),
          Text(
            '\$ ${product.price.toStringAsFixed(2)}',
            style: AppStyles.textMedium12.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/icon_fav_buttom.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.productDetails, extra: product);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 تمنع الـ overflow
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: product.imageCover,
                  fit: BoxFit.cover, // 👈 كان fill فممكن يسبب تمدد زايد
                  height: 180.h,
                  width: double.infinity,
                  placeholder: (context, url) => Skeletonizer(
                    enabled: true,
                    child: Image.asset(AppAssets.imagesTestC, height: 180.h),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.imagesTestC, height: 180.h),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: IconFavButtom(product: product),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textSemiBold16,
          ),
          SizedBox(height: 4.h),
          Text(
            '\$ ${product.price.toStringAsFixed(2)}',
            style: AppStyles.textMedium12.copyWith(color: AppColors.grey),
          ),
          SizedBox(height: 4.h), // 👈 padding بسيط لتجنب أي overflow بسيط
        ],
      ),
    );
  }
}
