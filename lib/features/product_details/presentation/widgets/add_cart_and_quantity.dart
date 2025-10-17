import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/add_and_remove_button.dart';

class AddToCardAndQuantity extends StatelessWidget {
  const AddToCardAndQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              Text(
                'Available Quantity: 3',
                style: AppStyles.textRegular12.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Spacer(),
              AddAndRemoveButton(icon: Icons.remove),
              SizedBox(width: 16.w),
              Text('1', style: AppStyles.textRegular16),
              SizedBox(width: 16.w),
              AddAndRemoveButton(icon: Icons.add),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          child: CustomButton(title: 'Add to Cart'),
        ),
      ],
    );
  }
}
