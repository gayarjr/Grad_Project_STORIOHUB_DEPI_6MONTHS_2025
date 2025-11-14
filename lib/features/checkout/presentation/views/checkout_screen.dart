import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:gradprojectstorio/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:gradprojectstorio/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/checkout_screen_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.total, required this.cartId});

  final String total;
  final String cartId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        checkoutRepo: CheckoutRepoImpl(
          checkoutRemoteDataSource: CheckoutRemoteDataSourceImpl(
            apiService: ApiService(Dio()),
          ),
        ),
      ),
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
