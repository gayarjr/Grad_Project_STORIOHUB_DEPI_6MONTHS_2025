import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_state.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/loading_categories.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/title_and_see_all.dart';
import 'category_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return LoadingCategories();
        } else if (state is CategoriesLoaded) {
          final List<CategoryEntity> categories = state.categories;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndSeeAll(
                title: 'Categories',
                onTap: () {
                  context.push(AppRoutes.categories, extra: categories);
                },
              ),
              SizedBox(height: 12.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: index == categories.length - 1 ? 0 : 16.w,
                      ),
                      child: CategoryItem(
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
                ),
              ),
            ],
          );
        } else if (state is CategoriesError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
