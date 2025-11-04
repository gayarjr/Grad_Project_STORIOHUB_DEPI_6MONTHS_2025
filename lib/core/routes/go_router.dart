import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/auth/presentation/views/register_page.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/views/products_view.dart';
import 'package:gradprojectstorio/features/intro/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gradprojectstorio/features/intro/splash/presentation/pages/splash_page.dart';
import 'package:gradprojectstorio/features/main/main_view.dart';
import 'package:gradprojectstorio/features/product_details/presentation/views/product_details_view.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/my_order_pages_withouts_data.dart';

import '../../features/auth/presentation/views/login_view.dart';

abstract class AppGoRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),

      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.products,
        builder: (context, state) =>
            ProductsView(products: state.extra as List<ProductEntity>),
      ),
      GoRoute(
        path: AppRoutes.productDetails,
        builder: (context, state) =>
            ProductDetailsView(product: state.extra as ProductEntity),
      ),

      GoRoute(
        path: AppRoutes.myordersettings,
        builder: (context, state) => MyOrdersScreenWithoutData(),
      ),
      GoRoute(
        path: AppRoutes.anothermyordersettingsdata,
        builder: (context, state) => MyOrder(),
      ),
    ],
  );
}
