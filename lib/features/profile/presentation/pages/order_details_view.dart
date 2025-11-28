import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Details', style: AppStyles.textSemiBold24),
      ),
      body: OrderDetailsViewBody(),
    );
  }
}
