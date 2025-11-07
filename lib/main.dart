import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/functions/theme_app.dart';
import 'package:gradprojectstorio/core/routes/go_router.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
// Home imports
import 'package:gradprojectstorio/features/home/data/repositories/product_repository.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';
// Hive and Wishlist imports
import 'package:gradprojectstorio/features/watchlist/data/data_sources/local_wishlist_data_source.dart';
import 'package:gradprojectstorio/features/watchlist/data/repos/wishlist_repo_impl.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Prefs.init();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<ProductEntity>('watchlist');
  runApp(DevicePreview(builder: (context) => const Storio()));
}

class Storio extends StatelessWidget {
  const Storio({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          //  Categories Cubit
          BlocProvider(
            create: (context) =>
                CategoriesCubit(CategoriesRepository())..fetchCategories(),
          ),

          //  Products Cubit
          BlocProvider(
            create: (context) =>
                ProductCubit(ProductRepository())..fetchAllProducts(),
          ),

          //  Wishlist Cubit
          BlocProvider(
            create: (context) => WishlistCubit(
              wishlistRepo: WishlistRepoImpl(
                localWishlistDataSource: LocalWishlistDataSourceImpl(),
              ),
            ),
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
