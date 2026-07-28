abstract final class AppRoutes {
  static const String onboarding = '/';

  static const String home = '/home';

  static const String statistics = '/statistics';

  static const String settings = '/settings';

  static const String sessionHistory = '/session-history/:topicId';

  static String sessionHistoryLocation(
    int topicId,
  ) {
    return '/session-history/$topicId';
  }
}
