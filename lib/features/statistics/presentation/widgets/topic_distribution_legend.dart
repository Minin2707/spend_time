import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';
import 'package:spend_time/features/statistics/presentation/helpers/topic_distribution_palette.dart';
import 'package:spend_time/features/statistics/presentation/helpers/topic_distribution_percentage_calculator.dart';

class TopicDistributionLegend extends StatelessWidget {
  const TopicDistributionLegend({
    super.key,
    required this.items,
  });

  final List<TopicDistributionItem> items;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      children: [
        for (int index = 0; index < items.length; index++)
          _TopicDistributionLegendItem(
            item: items[index],
            percentage: TopicDistributionPercentageCalculator.percentageFor(
              items: items,
              index: index,
            ),
            color: TopicDistributionPalette.colorFor(
              index,
            ),
          ),
      ],
    );
  }
}

class _TopicDistributionLegendItem extends StatelessWidget {
  const _TopicDistributionLegendItem({
    required this.item,
    required this.percentage,
    required this.color,
  });

  final TopicDistributionItem item;

  final int percentage;

  final Color color;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: AppSpacing.sm,
        ),
        Text(
          '${item.topicName} — $percentage%',
        ),
      ],
    );
  }
}
