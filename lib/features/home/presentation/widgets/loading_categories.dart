import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingCategories extends StatelessWidget {
  const LoadingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: AppStyles.textBold20),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CategoryItem(
                    category: CategoryEntity(id: '', name: '   ', image: ''),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
