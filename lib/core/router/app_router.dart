import 'package:go_router/go_router.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/settings/presentation/screens/settings_screen.dart';
import 'package:spend_time/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:spend_time/features/sessions/presentation/screens/session_history_screen.dart';
import 'package:spend_time/features/statistics/presentation/screens/statistics_screen.dart';
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
      GoRoute(
        path: AppRoutes.statistics,
        builder: (_, _) => const StatisticsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, _) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.sessionHistory,
        builder: (
          _,
          state,
        ) {
          final int topicId = int.parse(
            state.pathParameters['topicId']!,
          );

          return SessionHistoryScreen(
            topicId: topicId,
          );
        },
      ),
    ],
  );
}
