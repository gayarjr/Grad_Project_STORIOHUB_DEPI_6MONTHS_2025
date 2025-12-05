import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/di/service_locator.dart';
import 'package:gradprojectstorio/core/functions/theme_app.dart';
import 'package:gradprojectstorio/core/routes/go_router.dart';
import 'package:gradprojectstorio/core/services/custom_observer_bloc.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/features/cart/domain/repo/cart_repo.dart';
import 'package:gradprojectstorio/features/home/data/repositories/product_repository.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/categories_cubit.dart';
import 'package:gradprojectstorio/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:gradprojectstorio/features/watchlist/domain/repos/wishlist_repo.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/cubit/wishlist_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Prefs.init();

  Bloc.observer = CustomObserverBloc();
  serverLocator();
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
          BlocProvider(
            create: (context) =>
                CategoriesCubit(CategoriesRepository())..fetchCategories(),
          ),
          BlocProvider(
            create: (context) =>
                ProductCubit(ProductRepository())..fetchAllProducts(),
          ),
          BlocProvider(
            create: (context) =>
                WishlistCubit(wishlistRepo: getIt<WishlistRepo>()),
          ),
          BlocProvider(
            create: (context) =>
                CartCubit(cartRepo: getIt<CartRepo>())..getCart(),
          ),
          BlocProvider(
            create: (context) =>
                AddressCubit(profileRepo: getIt<ProfileRepo>())..getAddress(),
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
