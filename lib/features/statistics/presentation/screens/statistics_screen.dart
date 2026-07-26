import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/features/statistics/application/statistics_provider.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/presentation/widgets/statistics_summary_card.dart';
import 'package:spend_time/features/statistics/presentation/widgets/topic_distribution_list.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    const StatisticsPeriod period = StatisticsPeriod.today;

    final statistics = ref.watch(
      statisticsProvider(
        period,
      ),
    );
    final topicDistribution = ref.watch(
      topicDistributionProvider(
        period,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
        ),
      ),
      body: statistics.when(
        data: (summary) {
          return topicDistribution.when(
            data: (items) {
              return ListView(
                padding: const EdgeInsets.all(
                  AppSpacing.md,
                ),
                children: [
                  StatisticsSummaryCard(
                    summary: summary,
                    period: period,
                  ),
                  if (items.isNotEmpty) ...[
                    const SizedBox(
                      height: AppSpacing.md,
                    ),
                    TopicDistributionList(
                      items: items,
                    ),
                  ],
                ],
              );
            },
            loading: () => const AppLoadingView(),
            error: (error, stackTrace) => AppErrorView(
              message: error.toString(),
            ),
          );
        },
        loading: () => const AppLoadingView(),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
        ),
      ),
    );
  }
}
