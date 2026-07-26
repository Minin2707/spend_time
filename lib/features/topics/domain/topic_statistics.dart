class TopicStatistics {
  const TopicStatistics({
    required this.today,
    required this.total,
  });

  final Duration today;

  final Duration total;

  static const TopicStatistics empty = TopicStatistics(
    today: Duration.zero,
    total: Duration.zero,
  );

  TopicStatistics copyWith({
    Duration? today,
    Duration? total,
  }) {
    return TopicStatistics(
      today: today ?? this.today,
      total: total ?? this.total,
    );
  }
}