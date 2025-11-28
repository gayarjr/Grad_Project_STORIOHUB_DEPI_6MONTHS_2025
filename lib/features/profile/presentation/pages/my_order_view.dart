import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/my_orders_view_body.dart';

class MyOrderMainPage extends StatelessWidget {
  const MyOrderMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders', style: AppStyles.textSemiBold24),
      ),
      body: MyOrdersViewBody(),
    );
  }
}
