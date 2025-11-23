import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/theme_app.dart';
import 'package:gradprojectstorio/core/routes/go_router.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/services/custom_observer_bloc.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';

// Home imports
import 'package:gradprojectstorio/features/home/data/repositories/product_repository.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';

// Cart imports
import 'package:gradprojectstorio/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:gradprojectstorio/features/cart/data/repo/cart_repo_impl.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';

// Profile imports
import 'package:gradprojectstorio/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:gradprojectstorio/features/profile/data/repos/profile_repo_impl.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/My_Order_Cubit/my_order_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order_main_page.dart';

// Wishlist imports
import 'package:gradprojectstorio/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:gradprojectstorio/features/watchlist/data/repos/wishlist_repo_impl.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_cubit.dart';

// Hive imports
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Prefs.init();

  Bloc.observer = CustomObserverBloc();

  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<ProductEntity>('watchlist');

  runApp(DevicePreview(builder: (context) => const Storio()));
}

class Storio extends StatelessWidget {
  const Storio({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(Dio());

    return RepositoryProvider<ProfileRepo>(
      create: (context) => ProfileRepoImpl(
        profileRemoteDataSource: ProfileRemoteDataSourceImpl(
          apiService: apiService,
        ),
      ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MultiBlocProvider(
          providers: [
            // Categories Cubit
            BlocProvider(
              create: (context) =>
                  CategoriesCubit(CategoriesRepository())..fetchCategories(),
            ),

            // Products Cubit
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
                cartRepo: CartRepoImpl(
                  cartRemoteDataSource: CartRemoteDataSourceImpl(
                    apiService: apiService,
                  ),
                ),
              )..getCart(),
            ),

            // Address Cubit
            BlocProvider(
              create: (context) =>
                  AddressCubit(profileRepo: context.read<ProfileRepo>())
                    ..getAddress(),
            ),

            // MyOrder Cubit
            BlocProvider(
              create: (context) =>
                  MyOrderCubit(profileRepo: context.read<ProfileRepo>())
                    ..getOrder(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeApp(),
            routerConfig: AppGoRouter.router,
          ),
        ),
      ),
    );
  }
}
