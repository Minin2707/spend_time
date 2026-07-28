import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/domain/statistics_summary.dart';
import 'package:spend_time/features/statistics/presentation/mappers/statistics_period_label.dart';

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
            period.localizedLabel(
              context.l10n,
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: AppSpacing.lg,
          ),
          _StatisticsSummaryRow(
            label: context.l10n.statisticsSummaryTotalTime,
            value: DurationFormatter.formatClock(
              summary.totalTime,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: context.l10n.statisticsSummarySessionsCount,
            value: summary.sessionsCount.toString(),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: context.l10n.statisticsSummaryAverageSession,
            value: DurationFormatter.formatClock(
              summary.averageSession,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          _StatisticsSummaryRow(
            label: context.l10n.statisticsSummaryLongestSession,
            value: DurationFormatter.formatClock(
              summary.longestSession,
            ),
          ),
        ],
      ),
    );
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            label,
          ),
        ),
        const SizedBox(
          width: AppSpacing.md,
        ),
        Text(
          value,
          softWrap: false,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
