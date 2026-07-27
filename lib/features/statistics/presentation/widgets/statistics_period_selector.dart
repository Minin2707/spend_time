import 'package:flutter/material.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';

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
    return SegmentedButton<StatisticsPeriod>(
      segments: const [
        ButtonSegment(
          value: StatisticsPeriod.today,
          label: Text(
            'Today',
          ),
        ),
        ButtonSegment(
          value: StatisticsPeriod.week,
          label: Text(
            'Week',
          ),
        ),
        ButtonSegment(
          value: StatisticsPeriod.month,
          label: Text(
            'Month',
          ),
        ),
        ButtonSegment(
          value: StatisticsPeriod.year,
          label: Text(
            'Year',
          ),
        ),
        ButtonSegment(
          value: StatisticsPeriod.all,
          label: Text(
            'All',
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
    );
  }
}
