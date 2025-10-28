import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/navigate_to_tab.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/categories_section.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/new_arrival_section.dart';
import 'package:gradprojectstorio/core/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            SearchTextField(
              readOnly: true,
              onTap: () {
                navigateToTab(context, 1);
              },
            ),
            SizedBox(height: 24.h),
            CategoriesSection(),
            SizedBox(height: 24.h),
            NewArrivalSection(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
