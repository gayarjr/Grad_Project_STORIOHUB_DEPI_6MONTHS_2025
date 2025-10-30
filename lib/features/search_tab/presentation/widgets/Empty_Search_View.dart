import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search for a product 🔍",
        style: TextStyle(fontSize: 16, color: AppColors.grey),
      ),
    );
  }
}
