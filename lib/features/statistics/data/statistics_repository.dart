import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/domain/statistics_summary.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';

abstract interface class StatisticsRepository {
  Future<StatisticsSummary> getSummary({
    required StatisticsPeriod period,
  });

  Future<List<TopicDistributionItem>> getTopicDistribution({
    required StatisticsPeriod period,
  });
}
