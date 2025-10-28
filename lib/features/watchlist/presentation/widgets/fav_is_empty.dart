import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/navigate_to_tab.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/custom_button.dart';

class FavIsEmpty extends StatelessWidget {
  const FavIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Favourites is Empty',
          textAlign: TextAlign.center,
          style: AppStyles.textBold16,
        ),
        SizedBox(height: 16.h),
        CustomButton(
          onPressed: () {
            navigateToTab(context, 0);
          },
          text: 'Explore Categories',
        ),
      ],
    );
  }
}
