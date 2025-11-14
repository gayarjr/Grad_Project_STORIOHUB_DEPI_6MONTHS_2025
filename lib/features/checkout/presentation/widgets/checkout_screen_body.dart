import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_snack_bar.dart';
import 'package:gradprojectstorio/core/widgets/success_dialog.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/total_and_button.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/shipping_address.dart';
import 'package:gradprojectstorio/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/address_cart_list.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({
    super.key,
    required this.total,
    required this.cartId,
  });

  final String total;
  final String cartId;

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late AddressResponse addressResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Divider(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Address', style: AppStyles.textSemiBold16),
              InkWell(
                onTap: () {
                  context.push(AppRoutes.adressBook);
                },
                child: Text(
                  'Change',
                  style: AppStyles.textMedium14.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoaded) {
                if (state.addresses.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 70,
                          color: AppColors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "No Saved Address",
                          style: AppStyles.textSemiBold24.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return AddressCartList(
                    address: state.addresses,
                    onTap: (address) {
                      setState(() {
                        addressResponse = address;
                      });
                    },
                  );
                }
              } else if (state is AddressError) {
                return Center(child: Text(state.message));
              } else {
                return Expanded(
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
          BlocListener<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
              if (state is CheckoutCashLoaded) {
                context.read<CartCubit>().getCart();
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    onDismiss: () => context.go(AppRoutes.main),
                    message: 'Order Placed Successfully',
                  ),
                );
              } else {
                if (state is CheckoutError) {
                  Navigator.pop(context);
                  customSnackBar(
                    context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              }
            },
            child: TotalAndButton(
              total: widget.total,
              onTap: () {
                context.read<CheckoutCubit>().cash(
                  cartId: widget.cartId,
                  request: CheckoutRequest(
                    shippingAddress: ShippingAddress(
                      details: addressResponse.details,
                      city: addressResponse.city,
                      phone: addressResponse.phone,
                    ),
                  ),
                );
              },
              buttonText: 'Place Order',
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
