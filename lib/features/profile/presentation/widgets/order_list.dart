import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/profile/domain/entities/orders_entity.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_item_widgets.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.orders});

  final List<OrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return OrderItemWidget(order: orders[index]);
      },
    );
  }
}
