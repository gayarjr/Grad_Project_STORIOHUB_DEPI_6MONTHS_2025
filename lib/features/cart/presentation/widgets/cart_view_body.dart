import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/product_cart_entity.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/cart_item.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/total_and_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
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
            onTap: () {
              context.push(AppRoutes.checkout, extra: '300');
            },
            buttonText: 'Checkout',
          ),
        ],
      ),
    );
  }
}
