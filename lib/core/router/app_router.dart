import 'package:go_router/go_router.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:spend_time/features/topics/presentation/screens/home_screen.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (
            final context,
            final state,
            ) =>
        const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (_, _) => const HomeScreen(),
      ),
    ],
  );
}