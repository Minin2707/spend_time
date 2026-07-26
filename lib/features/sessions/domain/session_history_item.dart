class SessionHistoryItem {
  const SessionHistoryItem({
    required this.startedAt,
    required this.endedAt,
    required this.duration,
  });

  final DateTime startedAt;

  final DateTime endedAt;

  final Duration duration;

  SessionHistoryItem copyWith({
    DateTime? startedAt,
    DateTime? endedAt,
    Duration? duration,
  }) {
    return SessionHistoryItem(
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      duration: duration ?? this.duration,
    );
  }
}
