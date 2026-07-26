class TopicDistributionItem {
  const TopicDistributionItem({
    required this.topicId,
    required this.topicName,
    required this.totalTime,
  });

  final int topicId;

  final String topicName;

  final Duration totalTime;

  TopicDistributionItem copyWith({
    int? topicId,
    String? topicName,
    Duration? totalTime,
  }) {
    return TopicDistributionItem(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      totalTime: totalTime ?? this.totalTime,
    );
  }
}
