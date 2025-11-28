import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/profile/domain/entities/orders_entity.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_item.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.order});

  final OrdersEntity order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #${order.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${order.items.length} Items'),
            ],
          ),
          const SizedBox(height: 16),
          ...order.items.map((item) => OrderItem(item: item)),
          const SizedBox(height: 16),
          const Text(
            'Order Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shipping Address: "),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  order.address,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Phone: "),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  order.phone,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Payment method: "),
              const Text(
                'Cash',
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
