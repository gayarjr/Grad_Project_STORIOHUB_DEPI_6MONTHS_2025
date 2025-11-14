import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/add_new_address_sheet.dart';

class AddressEmpty extends StatelessWidget {
  const AddressEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Icon(Icons.location_on, size: 70, color: AppColors.grey),
        SizedBox(height: 16),
        Text(
          "No Saved Address",
          style: AppStyles.textSemiBold24.copyWith(color: AppColors.grey),
        ),
        Spacer(),
        CustomButton(
          text: 'Add New Address',
          icon: Icons.add,
          onPressed: () => showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            builder: (context) => const AddNewAddressSheet(),
          ),
        ),
        SizedBox(height: 24.w),
      ],
    );
  }
}
