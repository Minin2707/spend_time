import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/router/main_navigation_shell.dart';
import 'package:spend_time/core/settings/presentation/screens/settings_screen.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/onboarding/application/onboarding_provider.dart';
import 'package:spend_time/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:spend_time/features/sessions/presentation/screens/session_history_screen.dart';
import 'package:spend_time/features/statistics/presentation/screens/statistics_screen.dart';
import 'package:spend_time/features/topics/presentation/screens/create_topic_screen.dart';
import 'package:spend_time/features/topics/presentation/screens/edit_topic_route_args.dart';
import 'package:spend_time/features/topics/presentation/screens/edit_topic_screen.dart';
import 'package:spend_time/features/topics/presentation/screens/home_screen.dart';

final appRouterProvider = Provider<GoRouter>(
  (ref) {
    final router = AppRouter.create(
      ref,
    );

    ref.onDispose(
      router.dispose,
    );

    return router;
  },
);

abstract final class AppRouter {
  static GoRouter create(
    Ref ref,
  ) {
    return GoRouter(
    initialLocation: AppRoutes.startup,
    redirect: (
      _,
      state,
    ) async {
      final User? user;

      try {
        user = await ref.read(
          onboardingProvider.future,
        );
      } catch (_) {
        return AppRoutes.onboarding;
      }

      final bool isOnboardingCompleted =
          user?.onboardingCompleted == true;
      final String location = state.uri.toString();

      if (location == AppRoutes.startup) {
        return isOnboardingCompleted
            ? AppRoutes.home
            : AppRoutes.onboarding;
      }

      if (location == AppRoutes.onboarding && isOnboardingCompleted) {
        return AppRoutes.home;
      }

      if (!isOnboardingCompleted && location != AppRoutes.onboarding) {
        return AppRoutes.onboarding;
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.startup,
        builder: (
          _,
          _,
        ) =>
            const Scaffold(
          body: AppLoadingView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (
            final context,
            final state,
            ) =>
        const OnboardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          _,
          _,
          navigationShell,
        ) =>
            MainNavigationShell(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (_, _) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.statistics,
                builder: (_, _) => const StatisticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (_, _) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.createTopic,
        builder: (_, _) => const CreateTopicScreen(),
      ),
      GoRoute(
        path: AppRoutes.editTopic,
        builder: (
          _,
          state,
        ) {
          final topicId = int.tryParse(
            state.pathParameters['topicId'] ?? '',
          );
          final extra = state.extra;

          if (topicId == null || extra is! EditTopicRouteArgs) {
            return const HomeScreen();
          }

          return EditTopicScreen(
            topicId: topicId,
            initialName: extra.initialName,
            initialColor: extra.initialColor,
            initialIcon: extra.initialIcon,
          );
        },
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
}
