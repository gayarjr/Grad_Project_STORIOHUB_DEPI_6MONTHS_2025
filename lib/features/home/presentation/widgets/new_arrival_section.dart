import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/widgets/product_card.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/product_state.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/loading_new_arrivals.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return LoadingNewArrivals();
        } else if (state is ProductLoaded) {
          final List<ProductEntity> products = state.products;
          return Column(
            children: [
              TitleAndSeeAll(
                title: 'New Arrivals',
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRoutes.products, extra: products);
                },
              ),
              SizedBox(height: 12.h),
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ],
          );
        } else if (state is ProductError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
