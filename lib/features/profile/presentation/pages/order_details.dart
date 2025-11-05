import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_details_wid.dart';

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
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                style: TextStyle(fontWeight: FontWeight.bold),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
