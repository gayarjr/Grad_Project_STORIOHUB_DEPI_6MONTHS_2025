import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/My_Order_Cubit/my_order_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/My_Order_Cubit/my_order_state.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order_pages_withouts_data.dart';

class MyOrderMainPage extends StatelessWidget {
  const MyOrderMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyOrderCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrdersLoaded) {
            if (state.orders.isEmpty) {
              return MyOrdersScreenWithoutData(); // لو مافيش داتا
            } else {
              return MyOrder(orders: state.orders); // لو فيه داتا
            }
          }

          if (state is OrdersError) {
            return Center(child: Text(state.message));
          }

          return SizedBox();
        },
      ),
    );
  }
}
