import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Arrivals', style: AppStyles.textSemiBold24),
      ),
      body: ProductsViewBody(products: products),
    );
  }
}
