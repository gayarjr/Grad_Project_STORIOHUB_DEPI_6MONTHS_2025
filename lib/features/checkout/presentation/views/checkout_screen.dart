import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/success_dialog.dart';
import 'package:gradprojectstorio/features/cart/presentation/widgets/total_and_button.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/address_cart_list.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.total});

  final String total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout', style: AppStyles.textSemiBold24),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Divider(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Address', style: AppStyles.textSemiBold16),
                InkWell(
                  onTap: () {},
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
            AddressCartList(),
            TotalAndButton(
              total: total,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    onDismiss: () => Navigator.pop(context),
                    message: 'Order Placed Successfully',
                  ),
                );
              },
              buttonText: 'Place Order',
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
