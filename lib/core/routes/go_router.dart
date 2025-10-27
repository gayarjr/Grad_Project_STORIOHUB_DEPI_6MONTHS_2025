import 'package:go_router/go_router.dart';
import 'package:gradprojectstorio/core/routes/app_routes.dart';
import 'package:gradprojectstorio/features/intro/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gradprojectstorio/features/intro/splash/presentation/pages/splash_page.dart';
import 'package:gradprojectstorio/features/register/presentation/pages/create_account.dart';

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
    ],
  );
}
