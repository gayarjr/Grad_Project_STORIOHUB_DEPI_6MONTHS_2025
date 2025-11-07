import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

class AddressCartItem extends StatelessWidget {
  const AddressCartItem({
    super.key,
    required this.isSelected,
    required this.address,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
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
                address,
                style: const TextStyle(fontSize: 14, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
