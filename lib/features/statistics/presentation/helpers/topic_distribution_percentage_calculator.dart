import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';

abstract final class TopicDistributionPercentageCalculator {
  static int percentageFor({
    required List<TopicDistributionItem> items,
    required int index,
  }) {
    final int totalMillis = items.fold<int>(
      0,
      (sum, item) => sum + item.totalTime.inMilliseconds,
    );

    if (totalMillis == 0) {
      return 0;
    }

    final int itemMillis = items[index].totalTime.inMilliseconds;

    return (itemMillis / totalMillis * 100).round();
  }
}
