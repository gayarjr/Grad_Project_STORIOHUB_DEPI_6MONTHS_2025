import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/core/widgets/icon_fav_buttom.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Details', style: AppStyles.textSemiBold24),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconFavButtom(product: product),
          SizedBox(width: 16.w),
        ],
      ),
      body: ProductDetailsViewBody(product: product),
    );
  }
}
