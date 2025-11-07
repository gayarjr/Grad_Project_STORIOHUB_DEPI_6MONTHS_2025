import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/cart_view_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart', style: AppStyles.textSemiBold24),
      ),
      body: CartViewBody(),
    );
  }
}
