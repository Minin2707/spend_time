import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/router/app_routes.dart';

class MainNavigationShell extends StatelessWidget {
  const MainNavigationShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          context.push(
            AppRoutes.createTopic,
          );
        },
        child: const Icon(
          Icons.add_rounded,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: [
          NavigationDestination(
            icon: const Icon(
              Icons.category_outlined,
            ),
            selectedIcon: const Icon(
              Icons.category_rounded,
            ),
            label: context.l10n.navigationTopics,
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.analytics_outlined,
            ),
            selectedIcon: const Icon(
              Icons.analytics_rounded,
            ),
            label: context.l10n.navigationStatistics,
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.settings_outlined,
            ),
            selectedIcon: const Icon(
              Icons.settings_rounded,
            ),
            label: context.l10n.navigationSettings,
          ),
        ],
      ),
    );
  }

  void _goBranch(
    int index,
  ) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
