import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.textBold20),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: AppStyles.textRegular16.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
