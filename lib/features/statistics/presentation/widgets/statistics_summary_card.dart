import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/domain/statistics_summary.dart';

class StatisticsSummaryCard extends StatelessWidget {
  const StatisticsSummaryCard({
    super.key,
    required this.summary,
    required this.period,
  });

  final StatisticsSummary summary;

  final StatisticsPeriod period;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _periodTitle(
              period,
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: AppSpacing.lg,
          ),
          _StatisticsSummaryRow(
            label: 'Общее время',
            value: DurationFormatter.formatClock(
              summary.totalTime,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: 'Количество сессий',
            value: summary.sessionsCount.toString(),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: 'Средняя длительность',
            value: DurationFormatter.formatClock(
              summary.averageSession,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: 'Самая длинная сессия',
            value: DurationFormatter.formatClock(
              summary.longestSession,
            ),
          ),
        ],
      ),
    );
  }

  String _periodTitle(
    StatisticsPeriod period,
  ) {
    return switch (period) {
      StatisticsPeriod.today => 'Today',
      StatisticsPeriod.week => 'Week',
      StatisticsPeriod.month => 'Month',
      StatisticsPeriod.year => 'Year',
      StatisticsPeriod.all => 'All',
    };
  }
}

class _StatisticsSummaryRow extends StatelessWidget {
  const _StatisticsSummaryRow({
    required this.label,
    required this.value,
  });

  final String label;

  final String value;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
          ),
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
