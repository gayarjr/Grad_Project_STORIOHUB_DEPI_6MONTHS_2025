import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64.r,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text('Your Cart Is Empty!', style: AppStyles.textSemiBold20),
          SizedBox(height: 12.h),
          Text(
            'When you add products, they\'ll\nappear here.',
            textAlign: TextAlign.center,
            style: AppStyles.textRegular16.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
