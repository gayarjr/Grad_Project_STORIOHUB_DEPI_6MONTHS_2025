import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.address});

  final AddressResponse address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Colors.black54,
            size: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "${address.details}, ${address.name}, ${address.city}",
              style: TextStyle(fontSize: 14, color: AppColors.primary),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.red),
            onPressed: () {
              context.read<AddressCubit>().deleteAddress(id: address.id ?? '');
            },
          ),
        ],
      ),
    );
  }
}
