import 'package:get_it/get_it.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:gradprojectstorio/features/cart/data/repo/cart_repo_impl.dart';
import 'package:gradprojectstorio/features/cart/domain/repo/cart_repo.dart';
import 'package:gradprojectstorio/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:gradprojectstorio/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:gradprojectstorio/features/checkout/domain/repo/checkout_repo.dart';
import 'package:gradprojectstorio/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:gradprojectstorio/features/profile/data/repos/profile_repo_impl.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:gradprojectstorio/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:gradprojectstorio/features/watchlist/data/repos/wishlist_repo_impl.dart';
import 'package:gradprojectstorio/features/watchlist/domain/repos/wishlist_repo.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<LocalWishlistDataSource>(
    () => LocalWishlistDataSourceImpl(),
  );

  getIt.registerLazySingleton<WishlistRepo>(
    () => WishlistRepoImpl(
      localWishlistDataSource: getIt<LocalWishlistDataSource>(),
    ),
  );

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileRemoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartRemoteDataSource: getIt<CartRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(
      checkoutRemoteDataSource: getIt<CheckoutRemoteDataSource>(),
    ),
  );
}
