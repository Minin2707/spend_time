import 'package:spend_time/features/topics/domain/topic_color_key.dart';

class TopicDistributionItem {
  const TopicDistributionItem({
    required this.topicId,
    required this.topicName,
    required this.colorKey,
    required this.totalTime,
  });

  final int topicId;

  final String topicName;

  final TopicColorKey colorKey;

  final Duration totalTime;

  TopicDistributionItem copyWith({
    int? topicId,
    String? topicName,
    TopicColorKey? colorKey,
    Duration? totalTime,
  }) {
    return TopicDistributionItem(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      colorKey: colorKey ?? this.colorKey,
      totalTime: totalTime ?? this.totalTime,
    );
  }
}
