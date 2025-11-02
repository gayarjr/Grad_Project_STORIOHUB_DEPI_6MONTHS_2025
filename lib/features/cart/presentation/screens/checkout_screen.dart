import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/New_Address/presentation/views/address_page.dart';

import '../../domain/entities/cart_item.dart';
import '../../presentation/cubit/checkout_cubit.dart';
import '../../presentation/widgets/address_selection_widget.dart';
import '../../presentation/widgets/success_dialog.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/checkout_state.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final double subtotal;

  const CheckoutScreen({
    Key? key,
    required this.cartItems,
    required this.subtotal,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _promoController = TextEditingController();
  bool _showAddresses = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => SuccessDialog(
                onDismiss: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Back to cart
                  context.read<CartCubit>().loadCart();
                },
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CheckoutError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is CheckoutLoaded) {
            final total = widget.subtotal + state.shippingFee;

            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 120.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Delivery Address Section
                            Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery Address',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPage(),
                                        ),
                                      );
                                      setState(() {
                                        _showAddresses = false;
                                      });
                                    },
                                    child: Text(
                                      'Change',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  /*
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _showAddresses = !_showAddresses;
                                      });
                                    },
                                    child: Text(
                                      'Change',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                            // Selected Address
                            if (!_showAddresses)
                              AddressSelectionWidget(
                                address: state.selectedAddress,
                                isSelected: true,
                                onTap: () {},
                              ),
                            // All Addresses
                            if (_showAddresses)
                              ...state.addresses.map((address) {
                                return AddressSelectionWidget(
                                  address: address,
                                  isSelected:
                                      address.id == state.selectedAddress.id,
                                  onTap: () {
                                    context.read<CheckoutCubit>().selectAddress(
                                      address,
                                    );
                                    setState(() {
                                      _showAddresses = false;
                                    });
                                  },
                                );
                              }).toList(),
                            SizedBox(height: 24.h),
                            // Payment Method Section
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Payment Method',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    size: 32.r,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'Credit Card',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.r,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            // Shipping Fee
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping fee',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Text(
                                    '\$ ${state.shippingFee.toInt()}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            // Total
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${total.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            // Promo Code
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: TextField(
                                        controller: _promoController,
                                        decoration: InputDecoration(
                                          hintText: 'Enter promo code',
                                          hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.grey[500],
                                          ),
                                          prefixIcon: Icon(
                                            Icons.local_offer_outlined,
                                            color: Colors.grey[600],
                                            size: 24.r,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.w,
                                            vertical: 16.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Container(
                                    height: 56.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        if (_promoController.text.isNotEmpty) {
                                          context
                                              .read<CheckoutCubit>()
                                              .applyPromoCode(
                                                _promoController.text,
                                              );
                                        }
                                      },
                                      child: Text(
                                        'Add',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Place Order Button
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CheckoutCubit>().placeOrder(
                            items: widget.cartItems,
                            total: widget.subtotal,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
