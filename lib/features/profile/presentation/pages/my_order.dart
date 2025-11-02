import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_item_idgets.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OrderItemWidget(
            orderNumber: 'Order #12456',
            itemsCount: '6 items',
            price: '\$1,180',
            imageUrl:
                'https://t3.ftcdn.net/jpg/07/29/93/92/360_F_729939271_ceFXHlGDWVd6RdQjB0TXx1VvhKrYOHe9.jpg',
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
