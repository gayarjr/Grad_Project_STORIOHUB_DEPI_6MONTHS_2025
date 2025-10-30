import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No products found 😔",
        style: TextStyle(fontSize: 16, color: AppColors.grey),
      ),
    );
  }
}
