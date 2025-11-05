import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/theme_app.dart';
import 'package:gradprojectstorio/core/routes/go_router.dart';
import 'package:gradprojectstorio/features/home/data/repositories/Product_Repository.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';

// Cart imports
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'features/cart/domain/usecases/place_order_usecase.dart';
import 'features/cart/domain/usecases/remove_item_usecase.dart';
import 'features/cart/domain/usecases/update_quantity_usecase.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/cart/presentation/cubit/checkout_cubit.dart';

// Wishlist imports
import 'features/watchlist/data/repos/wishlist_repo_impl.dart';
import 'features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'features/watchlist/presentation/cubit/wishlist_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  تم حذف Hive completely
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductEntityAdapter());
  // Hive.registerAdapter(CategoryEntityAdapter());
  // await Hive.openBox<ProductEntity>('watchlist');

  runApp(DevicePreview(builder: (context) => const Storio()));
}

class Storio extends StatelessWidget {
  const Storio({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize cart dependencies (Singleton pattern)
    final cartRepository = CartRepositoryImpl();
    final getCartItemsUseCase = GetCartItemsUseCase(cartRepository);
    final addToCartUseCase = AddToCartUseCase(cartRepository);
    final updateQuantityUseCase = UpdateQuantityUseCase(cartRepository);
    final removeItemUseCase = RemoveItemUseCase(cartRepository);
    final placeOrderUseCase = PlaceOrderUseCase(cartRepository);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CategoriesCubit(CategoriesRepository())..fetchCategories(),
          ),
          BlocProvider(
            create: (context) =>
                ProductCubit(ProductRepository())..fetchAllProducts(),
          ),
          // Wishlist Cubit
          BlocProvider(
            create: (context) => WishlistCubit(
              wishlistRepo: WishlistRepoImpl(
                localWishlistDataSource: LocalWishlistDataSourceImpl(),
              ),
            ),
          ),

          // Cart Cubit
          BlocProvider(
            create: (context) => CartCubit(
              getCartItemsUseCase: getCartItemsUseCase,
              addToCartUseCase: addToCartUseCase,
              updateQuantityUseCase: updateQuantityUseCase,
              removeItemUseCase: removeItemUseCase,
              repository: cartRepository,
            )..loadCart(), // Load cart on initialization
          ),

          // Checkout Cubit
          BlocProvider(
            create: (context) => CheckoutCubit(
              repository: cartRepository,
              placeOrderUseCase: placeOrderUseCase,
            )..loadCheckout(), // Load checkout on initialization
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeApp(),
          routerConfig: AppGoRouter.router,
        ),
      ),
    );
  }
}
