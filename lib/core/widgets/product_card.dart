import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_assets.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/icon_fav_buttom.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_state.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isAdding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRoutes.productDetails, extra: widget.product);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.imageCover,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Skeletonizer(
                        enabled: true,
                        child: Image.asset(
                          AppAssets.imagesTestC,
                          fit: BoxFit.cover,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(AppAssets.imagesTestC, fit: BoxFit.cover),
                    ),

                    // Favorite Button (Top Right)
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: IconFavButtom(product: widget.product),
                    ),

                    // Add to Cart Button (Bottom Right)
                    Positioned(
                      bottom: 8.h,
                      right: 8.w,
                      child: BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {
                          if (state is CartItemAdded) {
                            setState(() => _isAdding = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        '${widget.product.title} added to cart',
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            );
                          } else if (state is CartError) {
                            setState(() => _isAdding = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: ${state.message}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: _isAdding
                                ? null
                                : () async {
                                    setState(() => _isAdding = true);

                                    // Add to cart with default size (you can show size selector dialog if needed)
                                    context.read<CartCubit>().addToCart(
                                      id: widget.product.id,
                                      name: widget.product.title,
                                      size: 'M',
                                      // Default size, or show dialog to select
                                      price: widget.product.price.toDouble(),
                                      imageUrl: widget.product.imageCover,
                                      quantity: 1,
                                    );
                                  },
                            child: Container(
                              width: 36.r,
                              height: 36.r,
                              decoration: BoxDecoration(
                                color: _isAdding
                                    ? Colors.grey.withOpacity(0.9)
                                    : Colors.black.withOpacity(0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: _isAdding
                                  ? Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.w,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 20.r,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textSemiBold16,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$ ${widget.product.price.toStringAsFixed(2)}',
                    style: AppStyles.textMedium12.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
