import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:gradprojectstorio/features/categories/data/repo/categories_repo_impl.dart';
import 'package:gradprojectstorio/features/categories/presentation/managers/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:gradprojectstorio/features/categories/presentation/widgets/products_category_view_body.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class ProductsCategoryView extends StatelessWidget {
  const ProductsCategoryView({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsByCategoryCubit(
        categoriesRepo: CategoriesRepoImpl(
          categoriesRemoteDataSource: CategoriesRemoteDataSourceImpl(
            apiService: ApiService(Dio()),
          ),
        ),
      )..getProductsByCategory(categoryId: category.id),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category.name, style: AppStyles.textSemiBold24),
        ),
        body: SafeArea(
          child: ProductsCategoryViewBody(category: category.name),
        ),
      ),
    );
  }
}
