class StatisticsSummary {
  const StatisticsSummary({
    required this.totalTime,
    required this.sessionsCount,
    required this.averageSession,
    required this.longestSession,
  });

  final Duration totalTime;

  final int sessionsCount;

  final Duration averageSession;

  final Duration longestSession;

  StatisticsSummary copyWith({
    Duration? totalTime,
    int? sessionsCount,
    Duration? averageSession,
    Duration? longestSession,
  }) {
    return StatisticsSummary(
      totalTime: totalTime ?? this.totalTime,
      sessionsCount: sessionsCount ?? this.sessionsCount,
      averageSession: averageSession ?? this.averageSession,
      longestSession: longestSession ?? this.longestSession,
    );
  }
}
