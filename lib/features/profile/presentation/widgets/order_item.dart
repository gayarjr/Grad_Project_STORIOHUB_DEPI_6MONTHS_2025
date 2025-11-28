import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/profile/domain/entities/orders_item_entity.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.item});

  final OrdersItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 80,
                  height: 80,
                  child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text('quantity: ${item.count}'),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '\$${item.price * item.count}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
