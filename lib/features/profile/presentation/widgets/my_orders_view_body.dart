import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/order_cubit/orders_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/empty_orders.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/order_list.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoaded) {
            if (state.orders.isEmpty) {
              return EmptyOrders();
            }
            return OrdersList(orders: state.orders);
          } else if (state is OrdersError) {
            return Center(
              child: Text(state.message, style: AppStyles.textBold16),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
