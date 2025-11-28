import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_item_idgets.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return OrderItemWidget(
          orderNumber: "Order #1245",
          itemsCount: "5items",
          price: "\$1200",
          imageUrl:
              'https://t3.ftcdn.net/jpg/07/29/93/92/360_F_729939271_ceFXHlGDWVd6RdQjB0TXx1VvhKrYOHe9.jpg',
        );
      },
    );
  }
}
