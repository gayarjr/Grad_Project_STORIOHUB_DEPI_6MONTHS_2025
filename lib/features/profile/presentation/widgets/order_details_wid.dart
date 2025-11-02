import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  final String itemName;
  final String quantity;
  final String price;
  final String assetPath;

  const OrderDetails({
    super.key,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                assetPath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
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
                    itemName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(quantity),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
