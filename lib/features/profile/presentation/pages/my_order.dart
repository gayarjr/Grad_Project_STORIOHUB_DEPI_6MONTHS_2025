import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/my_order.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_item_idgets.dart';

class MyOrder extends StatelessWidget {
  final List<OrderModel> orders;

  const MyOrder({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders', style: AppStyles.textSemiBold24),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Column(
            children: [
              OrderItemWidget(
                orderNumber: "Order #${order.id}",
                itemsCount: "${order.itemsCount} items",
                price: "\$${order.totalPrice}",
                imageUrl:
                    'https://t3.ftcdn.net/jpg/07/29/93/92/360_F_729939271_ceFXHlGDWVd6RdQjB0TXx1VvhKrYOHe9.jpg',
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
