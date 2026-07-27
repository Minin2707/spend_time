import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/features/statistics/application/statistics_provider.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/presentation/widgets/statistics_period_selector.dart';
import 'package:spend_time/features/statistics/presentation/widgets/statistics_summary_card.dart';
import 'package:spend_time/features/statistics/presentation/widgets/topic_distribution_chart.dart';
import 'package:spend_time/features/statistics/presentation/widgets/topic_distribution_legend.dart';
import 'package:spend_time/features/statistics/presentation/widgets/topic_distribution_list.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({
    super.key,
  });

  @override
  ConsumerState<StatisticsScreen> createState() =>
      _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  StatisticsPeriod _selectedPeriod = StatisticsPeriod.today;

  @override
  Widget build(
    BuildContext context,
  ) {
    final statistics = ref.watch(
      statisticsProvider(
        _selectedPeriod,
      ),
    );
    final topicDistribution = ref.watch(
      topicDistributionProvider(
        _selectedPeriod,
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
                  StatisticsPeriodSelector(
                    selectedPeriod: _selectedPeriod,
                    onChanged: (period) {
                      setState(() {
                        _selectedPeriod = period;
                      });
                    },
                  ),
                  const SizedBox(
                    height: AppSpacing.md,
                  ),
                  StatisticsSummaryCard(
                    summary: summary,
                    period: _selectedPeriod,
                  ),
                  if (items.isNotEmpty) ...[
                    const SizedBox(
                      height: AppSpacing.md,
                    ),
                    TopicDistributionChart(
                      items: items,
                    ),
                    const SizedBox(
                      height: AppSpacing.md,
                    ),
                    TopicDistributionLegend(
                      items: items,
                    ),
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
