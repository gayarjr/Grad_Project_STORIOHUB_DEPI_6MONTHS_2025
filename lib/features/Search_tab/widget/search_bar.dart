import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';
import 'package:gradprojectstorio/features/Search_tab/pages/search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Map<String, String>> allProducts;

  const CustomSearchBar({super.key, required this.allProducts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchScreen(allProducts: allProducts),
          ),
        );
      },
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: AppConstants.searchHint,
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
