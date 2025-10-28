import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalWishlistDataSource {
  Future<void> addToWatchlist({required ProductEntity product});
  Future<void> removeFromWatchlist({required ProductEntity product});
  Future<bool> isProductInWatchlist({required String productId});
  Future<List<ProductEntity>> getWatchlist();
}

class LocalWishlistDataSourceImpl extends LocalWishlistDataSource {
  @override
  Future<void> addToWatchlist({required ProductEntity product}) async {
    final watchlistBox = Hive.box<ProductEntity>('watchlist');
    await watchlistBox.put(product.id, product);
  }

  @override
  Future<void> removeFromWatchlist({required ProductEntity product}) async {
    final watchlistBox = Hive.box<ProductEntity>('watchlist');
    await watchlistBox.delete(product.id);
  }

  @override
  Future<bool> isProductInWatchlist({required String productId}) async {
    final watchlistBox = Hive.box<ProductEntity>('watchlist');
    return watchlistBox.containsKey(productId);
  }

  @override
  Future<List<ProductEntity>> getWatchlist() async {
    final watchlistBox = Hive.box<ProductEntity>('watchlist');
    return watchlistBox.values.toList();
  }
}
