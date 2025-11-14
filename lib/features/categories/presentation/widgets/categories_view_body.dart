import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/categories/presentation/widgets/category_card.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) => CategoryCard(
                category: categories[index],
                onTap: () {
                  context.push(
                    AppRoutes.productsCategories,
                    extra: categories[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
