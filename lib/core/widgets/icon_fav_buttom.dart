import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_state.dart';

class IconFavButtom extends StatelessWidget {
  const IconFavButtom({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final isInWatchlist =
            state is WishlistLoaded && state.wishlist.contains(product);
        return GestureDetector(
          onTap: () {
            context.read<WishlistCubit>().toggleWatchlist(product);
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: isInWatchlist
                ? Icon(Icons.favorite, color: AppColors.red)
                : Icon(Icons.favorite_outline, color: AppColors.primary),
          ),
        );
      },
    );
  }
}
