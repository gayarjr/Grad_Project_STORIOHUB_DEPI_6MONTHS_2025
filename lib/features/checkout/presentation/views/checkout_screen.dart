import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/di/service_locator.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/checkout/domain/repo/checkout_repo.dart';
import 'package:gradprojectstorio/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/checkout_screen_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.total, required this.cartId});

  final String total;
  final String cartId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(checkoutRepo: getIt<CheckoutRepo>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Checkout', style: AppStyles.textSemiBold24),
        ),
        body: CheckoutScreenBody(total: total, cartId: cartId),
      ),
    );
  }
}
