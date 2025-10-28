import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/watchlist/domain/repos/wishlist_repo.dart';
import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;

  WishlistCubit({required this.wishlistRepo}) : super(WishlistInitial());

  Future<void> loadWatchlist() async {
    emit(WishlistLoading());
    try {
      final watchlist = await wishlistRepo.getWatchlist();
      emit(WishlistLoaded(watchlist));
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> toggleWatchlist(ProductEntity product) async {
    try {
      final isInWatchlist = await wishlistRepo.isProductInWatchlist(
        productId: product.id,
      );
      if (isInWatchlist) {
        await wishlistRepo.removeFromWatchlist(product: product);
      } else {
        await wishlistRepo.addToWatchlist(product: product);
      }
      await loadWatchlist();
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }
}
