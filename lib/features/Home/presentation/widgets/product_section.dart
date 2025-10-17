import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/Home/presentation/widgets/product_card.dart';
import 'package:gradprojectstorio/features/product_details/presentation/page/product_details_view.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Show All",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final item = products[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailsView(),
                    ),
                  );
                },
                child: ProductCard(
                  title: item["title"]!,
                  image: item["image"]!,
                  price: item["price"]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
