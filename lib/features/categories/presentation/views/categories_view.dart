import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/categories/presentation/widgets/categories_view_body.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Categories', style: AppStyles.textSemiBold24),
      ),
      body: SafeArea(child: CategoriesViewBody(categories: categories)),
    );
  }
}
