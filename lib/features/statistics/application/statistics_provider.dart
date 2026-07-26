import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/features/statistics/data/statistics_repository_provider.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/domain/statistics_summary.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';

final statisticsProvider =
    FutureProvider.family<StatisticsSummary, StatisticsPeriod>(
  (
    ref,
    period,
  ) {
    final repository = ref.watch(
      statisticsRepositoryProvider,
    );

    return repository.getSummary(
      period: period,
    );
  },
);

final topicDistributionProvider =
    FutureProvider.family<List<TopicDistributionItem>, StatisticsPeriod>(
  (
    ref,
    period,
  ) {
    final repository = ref.watch(
      statisticsRepositoryProvider,
    );

    return repository.getTopicDistribution(
      period: period,
    );
  },
);
