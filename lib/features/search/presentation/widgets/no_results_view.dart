import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 20),
          const Text(
            "No Results Found!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Try a similar word or something more general.",
            style: TextStyle(fontSize: 14, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
