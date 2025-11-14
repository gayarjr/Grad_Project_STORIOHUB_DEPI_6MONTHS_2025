import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/empty_orders.dart';

class MyOrdersScreenWithoutData extends StatelessWidget {
  const MyOrdersScreenWithoutData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders', style: AppStyles.textSemiBold24),
      ),
      body: EmptyOrders(),
    );
  }
}
