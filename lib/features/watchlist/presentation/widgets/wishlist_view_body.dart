import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_state.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/widgets/fav_is_empty.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/widgets/fav_list.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            if (state.wishlist.isEmpty) {
              return FavIsEmpty();
            }
            return FavList(products: state.wishlist);
          } else if (state is WishlistError) {
            return Center(
              child: Text(state.message, style: AppStyles.textBold16),
            );
          } else {
            return FavIsEmpty();
          }
        },
      ),
    );
  }
}
