import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wishlist', style: AppStyles.textSemiBold16),
          SizedBox(height: 16.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) => WishlistItem(
                imageUrl: 'https://picsum.photos/400/300?2',
                name: 'Nike Air Zoom',
                price: 120.5,
                onAddToCart: () {},
                onDelete: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const WishlistItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, height: 126.h, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              children: [
                Text(name, style: AppStyles.textSemiBold16),
                SizedBox(height: 8.h),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: AppStyles.textRegular12,
                ),
                Divider(color: AppColors.secondaryColor, height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: onAddToCart,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                      child: VerticalDivider(color: AppColors.secondaryColor),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
