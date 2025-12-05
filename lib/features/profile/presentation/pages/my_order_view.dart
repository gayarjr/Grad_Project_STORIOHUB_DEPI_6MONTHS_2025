import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/di/service_locator.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/order_cubit/orders_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/my_orders_view_body.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersCubit(profileRepo: getIt<ProfileRepo>())
            ..getOrders(userId: Prefs.getCartId() ?? ''),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Orders', style: AppStyles.textSemiBold24),
        ),
        body: MyOrdersViewBody(),
      ),
    );
  }
}
