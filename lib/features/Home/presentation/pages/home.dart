import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';
import 'package:gradprojectstorio/features/Home/presentation/widgets/category_list.dart';
import 'package:gradprojectstorio/features/Home/presentation/widgets/image_slider.dart';
import 'package:gradprojectstorio/features/Home/presentation/widgets/product_section.dart';
import 'package:gradprojectstorio/features/Search_tab/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  final sliderImages = [
    "assets/images/image_slider.png",
    "assets/images/image_slider.png",
    "assets/images/image_slider.png",
  ];

  final categories = [
    "Women",
    "Men",
    "Kids",
    "Fashion",
    "Watches",
    "Blankets",
    "Jewelry",
    "Earrings",
    "Drawing",
    "Necklace",
    "Art",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textColor),
          onPressed: () {},
        ),
        title: const Text(
          AppConstants.appTitle,
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.greyShade,
              child: const Icon(Icons.person, color: AppColors.textColor),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              allProducts: [
                {
                  "title": "Leather Handbag",
                  "image": "assets/images/bags.png",
                  "price": "\$49.00",
                },
                {
                  "title": "Necklaces",
                  "image": "assets/images/Necklaces3.png",
                  "price": "\$79.00",
                },
                {
                  "title": "Carpets",
                  "image": "assets/images/Handcraft Carpets2.png",
                  "price": "\$120.00",
                },
                {
                  "title": "Handmade Carpet",
                  "image": "assets/images/Handcraft Carpets.png",
                  "price": "\$120.00",
                },
                {
                  "title": "Gold Necklace",
                  "image": "assets/images/Necklaces3.png",
                  "price": "\$60.00",
                },
                {
                  "title": "Diamond Ring",
                  "image": "assets/images/rings2.png",
                  "price": "\$150.00",
                },
              ],
            ),

            const SizedBox(height: 16),

            CategoryList(categories: categories),
            const SizedBox(height: 16),

            ImageSlider(
              images: sliderImages,
              onPageChanged: (index) => setState(() => activeIndex = index),
              activeIndex: activeIndex,
            ),

            const SizedBox(height: 20),

            ProductSection(
              title: "Best Selling Products",
              products: [
                {
                  "title": "Leather Handbag",
                  "image": "assets/images/bags.png",
                  "price": "\$49.00",
                },
                {
                  "title": "Necklaces",
                  "image": "assets/images/Necklaces3.png",
                  "price": "\$79.00",
                },
                {
                  "title": "Carpets",
                  "image": "assets/images/Handcraft Carpets2.png",
                  "price": "\$120.00",
                },
              ],
            ),

            const SizedBox(height: 20),

            ProductSection(
              title: "Handcraft Carpets",
              products: [
                {
                  "title": "Handmade Carpet",
                  "image": "assets/images/Handcraft Carpets.png",
                  "price": "\$120.00",
                },
                {
                  "title": "Traditional Carpet",
                  "image": "assets/images/Handcraft Carpets2.png",
                  "price": "\$95.00",
                },
                {
                  "title": "Colorful Carpet",
                  "image": "assets/images/Handcraft Carpets.png",
                  "price": "\$110.00",
                },
              ],
            ),

            const SizedBox(height: 20),

            ProductSection(
              title: "Shop Necklaces",
              products: [
                {
                  "title": "Gold Necklace",
                  "image": "assets/images/Necklaces3.png",
                  "price": "\$60.00",
                },
                {
                  "title": "Pearl Necklace",
                  "image": "assets/images/Necklaces.png",
                  "price": "\$80.00",
                },
                {
                  "title": "Silver Necklace",
                  "image": "assets/images/Necklaces2.png",
                  "price": "\$70.00",
                },
              ],
            ),

            const SizedBox(height: 20),

            ProductSection(
              title: "Shop Rings",
              products: [
                {
                  "title": "Diamond Ring",
                  "image": "assets/images/rings2.png",
                  "price": "\$150.00",
                },
                {
                  "title": "Golden Ring",
                  "image": "assets/images/rings.png",
                  "price": "\$130.00",
                },
                {
                  "title": "Silver Ring",
                  "image": "assets/images/rings2.png",
                  "price": "\$70.00",
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
