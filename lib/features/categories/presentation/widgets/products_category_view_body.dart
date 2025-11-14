import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/product_card.dart';
import 'package:gradprojectstorio/features/categories/presentation/managers/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:gradprojectstorio/features/categories/presentation/widgets/loading_products.dart';

class ProductsCategoryViewBody extends StatelessWidget {
  const ProductsCategoryViewBody({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
            builder: (context, state) {
              if (state is ProductsByCategoryLoaded) {
                if (state.products.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 70.sp,
                            color: AppColors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No products found',
                            style: AppStyles.textSemiBold24.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (_, index) =>
                        ProductCard(product: state.products[index]),
                  ),
                );
              } else if (state is ProductsByCategoryError) {
                return Center(
                  child: Text(state.message, style: AppStyles.textBold16),
                );
              } else {
                return const Expanded(child: LoadingProducts());
              }
            },
          ),
        ],
      ),
    );
  }
}
