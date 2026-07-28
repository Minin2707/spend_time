import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';
import 'package:spend_time/features/statistics/presentation/helpers/topic_distribution_color_mapper.dart';

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
    final Brightness brightness = Theme.of(context).brightness;

    return AppCard(
      child: Column(
        children: [
          for (int index = 0; index < items.length; index++) ...[
            _TopicDistributionRow(
              item: items[index],
              color: TopicDistributionColorMapper.colorFor(
                item: items[index],
                brightness: brightness,
              ),
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
    required this.color,
  });

  final TopicDistributionItem item;

  final Color color;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
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
