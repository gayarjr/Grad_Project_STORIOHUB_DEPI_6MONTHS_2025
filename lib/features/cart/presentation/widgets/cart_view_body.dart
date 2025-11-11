import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/product_cart_entity.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/cart_item.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/empty_cart.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/total_and_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cartEntity.products.isEmpty) {
              return EmptyCart();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartEntity.products.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItem(
                        product: state.cartEntity.products[index],
                      );
                    },
                  ),
                ),
                TotalAndButton(
                  total: state.cartEntity.totalPrice.toStringAsFixed(2),
                  onTap: () {
                    context.push(
                      AppRoutes.checkout,
                      extra: state.cartEntity.totalPrice.toStringAsFixed(2),
                    );
                  },
                  buttonText: 'Checkout',
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppStyles.textSemiBold20,
              ),
            );
          } else {
            return Skeletonizer(
              enabled: true,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItem(
                          product: ProductCartEntity(
                            id: '12',
                            imageCover:
                                'https://ecommerce.routemisr.com/Route-Academy-products/1680395631938-cover.jpeg',
                            title: 'T-Shirt',
                            count: 5,
                            price: 300,
                          ),
                        );
                      },
                    ),
                  ),
                  TotalAndButton(
                    total: '300',
                    onTap: () {},
                    buttonText: 'Checkout',
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
