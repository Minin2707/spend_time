import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';
import 'package:spend_time/features/statistics/presentation/helpers/topic_distribution_color_mapper.dart';

class TopicDistributionChart extends StatelessWidget {
  const TopicDistributionChart({
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

    final Brightness brightness = Theme.of(context).brightness;

    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sections: [
            for (int index = 0; index < items.length; index++)
              PieChartSectionData(
                value: items[index].totalTime.inMilliseconds.toDouble(),
                title: '',
                color: TopicDistributionColorMapper.colorFor(
                  item: items[index],
                  brightness: brightness,
                ),
              ),
          ],
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}
