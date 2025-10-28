import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:gradprojectstorio/features/watchlist/domain/repos/wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  final LocalWishlistDataSource localWishlistDataSource;

  WishlistRepoImpl({required this.localWishlistDataSource});

  @override
  Future<void> addToWatchlist({required ProductEntity product}) async {
    final isInWatchlist = await localWishlistDataSource.isProductInWatchlist(
      productId: product.id,
    );
    if (isInWatchlist) return;
    await localWishlistDataSource.addToWatchlist(product: product);
  }

  @override
  Future<List<ProductEntity>> getWatchlist() async {
    var products = await localWishlistDataSource.getWatchlist();
    return products;
  }

  @override
  Future<bool> isProductInWatchlist({required String productId}) async {
    return await localWishlistDataSource.isProductInWatchlist(
      productId: productId,
    );
  }

  @override
  Future<void> removeFromWatchlist({required ProductEntity product}) async {
    await localWishlistDataSource.removeFromWatchlist(product: product);
  }
}
