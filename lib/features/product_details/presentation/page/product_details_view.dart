import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/widgets/custom_app_bar.dart';
import 'package:gradprojectstorio/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppbar(), body: ProductDetailsViewBody());
  }
}
