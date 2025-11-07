import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

class SearchResultsView extends StatelessWidget {
  final List<ProductEntity> products;
  final void Function(ProductEntity product) onProductTap;

  const SearchResultsView({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 0.5,
        color: Color.fromARGB(255, 185, 184, 184),
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () => onProductTap(product),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageCover,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: AppStyles.textRegular15.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${product.price.toStringAsFixed(2)} EGP",
                        style: AppStyles.textRegular13.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
