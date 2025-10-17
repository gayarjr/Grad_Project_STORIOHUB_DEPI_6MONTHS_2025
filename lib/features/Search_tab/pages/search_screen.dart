import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/Home/presentation/widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  final List<Map<String, String>> allProducts;

  const SearchScreen({super.key, required this.allProducts});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filteredProducts = widget.allProducts.where((product) {
      final title = product["title"]!.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() => query = value);
          },
        ),
      ),
      body: filteredProducts.isEmpty
          ? const Center(
              child: Text(
                "No products found",
                style: TextStyle(fontSize: 16, color: AppColors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final item = filteredProducts[index];
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        height: constraints.maxHeight,
                        child: ProductCard(
                          title: item["title"]!,
                          image: item["image"]!,
                          price: item["price"]!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
