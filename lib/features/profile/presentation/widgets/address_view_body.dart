import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/add_new_address_sheet.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/address_item.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressLoaded) {
            if (state.addresses.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Icon(Icons.location_on, size: 70, color: AppColors.grey),
                  SizedBox(height: 16),
                  Text(
                    "No Saved Address",
                    style: AppStyles.textSemiBold24.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: 'Add New Address',
                    icon: Icons.add,
                    onPressed: () => showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                      ),
                      builder: (context) => const AddNewAddressSheet(),
                    ),
                  ),
                  SizedBox(height: 24.w),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Saved Address", style: AppStyles.textSemiBold16),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.addresses.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                    itemBuilder: (context, index) =>
                        AddressItem(address: state.addresses[index]),
                  ),
                ),
                SizedBox(height: 12.w),
                CustomButton(
                  text: 'Add New Address',
                  icon: Icons.add,
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.r),
                      ),
                    ),
                    builder: (context) => const AddNewAddressSheet(),
                  ),
                ),
                SizedBox(height: 24.w),
              ],
            );
          } else if (state is AddressError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
