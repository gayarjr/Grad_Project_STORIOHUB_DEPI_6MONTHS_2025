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

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text('Order Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Order #123456',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('6 Items'),
            ],
          ),
          const SizedBox(height: 16),
          const OrderDetails(
            itemName: 'Regular Fit Black T-Shirt',
            quantity: 'Quantity: 3',
            price: '\$1,290',
            assetPath: 'images/view.png',
          ),
          const SizedBox(height: 8),
          const OrderDetails(
            itemName: 'Regular Fit Black Hoodie ',
            quantity: 'Quantity: 3',
            price: '\$1,290',
            assetPath: 'images/view.png',
          ),
          const SizedBox(height: 32),
          const Text(
            'Order Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shipping Address:"),
              Flexible(
                fit: FlexFit.loose,
                child: const Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  ' 3 Newbridge Court, Chino Hills, CA 91709, United States',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Payment method:"),
              const Text(
                ' Cash ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Total Amount: "),
              const Text(
                '133',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
