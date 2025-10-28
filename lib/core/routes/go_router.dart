import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/presentation/views/products_view.dart';
import 'package:gradprojectstorio/features/intro/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gradprojectstorio/features/intro/splash/presentation/pages/splash_page.dart';
import 'package:gradprojectstorio/features/main/main_view.dart';
import 'package:gradprojectstorio/features/product_details/presentation/views/product_details_view.dart';
import 'package:gradprojectstorio/features/auth/presentation/pages/register_page.dart';

abstract class AppGoRouter {
  static final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
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
    ],
  );
}
