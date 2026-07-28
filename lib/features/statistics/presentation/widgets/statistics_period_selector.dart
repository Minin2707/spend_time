import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/presentation/mappers/statistics_period_label.dart';

class StatisticsPeriodSelector extends StatelessWidget {
  const StatisticsPeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onChanged,
  });

  final StatisticsPeriod selectedPeriod;

  final ValueChanged<StatisticsPeriod> onChanged;

  @override
  Widget build(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SegmentedButton<StatisticsPeriod>(
        segments: [
          for (final period in StatisticsPeriod.values)
            ButtonSegment(
              value: period,
              label: Text(
                period.localizedLabel(
                  context.l10n,
                ),
              ),
            ),
        ],
        selected: {
          selectedPeriod,
        },
        onSelectionChanged: (selection) {
          onChanged(
            selection.first,
          );
        },
      ),
    );
  }
}
