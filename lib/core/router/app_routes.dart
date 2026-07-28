abstract final class AppRoutes {
  static const String startup = '/startup';

  static const String onboarding = '/';

  static const String home = '/home';

  static const String statistics = '/statistics';

  static const String settings = '/settings';

  static const String createTopic = '/topics/create';

  static const String editTopic = '/topics/:topicId/edit';

  static const String sessionHistory = '/session-history/:topicId';

  static String editTopicPath(
    int topicId,
  ) {
    return '/topics/$topicId/edit';
  }

  static String sessionHistoryLocation(
    int topicId,
  ) {
    return '/session-history/$topicId';
  }
}
