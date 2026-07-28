import 'package:flutter/material.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';
import 'package:spend_time/features/topics/presentation/theme/topic_color_palette.dart';

abstract final class TopicDistributionColorMapper {
  static Color colorFor({
    required TopicDistributionItem item,
    required Brightness brightness,
  }) {
    return TopicColorPalette.colorFor(
      colorKey: item.colorKey,
      brightness: brightness,
    );
  }
}
