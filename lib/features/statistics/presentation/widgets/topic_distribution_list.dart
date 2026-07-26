import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';

class TopicDistributionList extends StatelessWidget {
  const TopicDistributionList({
    super.key,
    required this.items,
  });

  final List<TopicDistributionItem> items;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppCard(
      child: Column(
        children: [
          for (int index = 0; index < items.length; index++) ...[
            _TopicDistributionRow(
              item: items[index],
            ),
            if (index != items.length - 1)
              const SizedBox(
                height: AppSpacing.sm,
              ),
          ],
        ],
      ),
    );
  }
}

class _TopicDistributionRow extends StatelessWidget {
  const _TopicDistributionRow({
    required this.item,
  });

  final TopicDistributionItem item;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.topicName,
          ),
        ),
        Text(
          DurationFormatter.formatClock(
            item.totalTime,
          ),
        ),
      ],
    );
  }
}
