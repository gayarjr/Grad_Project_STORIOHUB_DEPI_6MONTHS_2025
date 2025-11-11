import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/product_cart_entity.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final ProductCartEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: product.imageCover,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                width: 80.w,
                height: 80.h,
                color: Colors.grey[200],
                child: Icon(Icons.error, color: Colors.grey, size: 32.r),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textSemiBold16,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    InkWell(
                      onTap: () {
                        context.read<CartCubit>().removeFromCart(
                          productId: product.id,
                        );
                      },
                      child: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
                Expanded(child: SizedBox(height: 10.h)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                      style: AppStyles.textSemiBold16,
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          _quantityButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (product.count > 1) {
                                context.read<CartCubit>().updateProductFromCart(
                                  productId: product.id,
                                  count: (--product.count).toString(),
                                );
                              } else {
                                customSnackBar(
                                  context,
                                  message: 'Can\'t be less than 1',
                                  type: AnimatedSnackBarType.warning,
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Text(
                              '${product.count}',
                              style: AppStyles.textSemiBold16,
                            ),
                          ),
                          _quantityButton(
                            icon: Icons.add,
                            onTap: () {
                              context.read<CartCubit>().updateProductFromCart(
                                productId: product.id,
                                count: (++product.count).toString(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(6.r),
        child: Icon(icon, size: 20.r),
      ),
    );
  }
}
