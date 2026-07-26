import 'package:spend_time/features/sessions/domain/session_history_item.dart';

class SessionHistoryGroup {
  const SessionHistoryGroup({
    required this.date,
    required this.sessions,
  });

  final DateTime date;

  final List<SessionHistoryItem> sessions;

  SessionHistoryGroup copyWith({
    DateTime? date,
    List<SessionHistoryItem>? sessions,
  }) {
    return SessionHistoryGroup(
      date: date ?? this.date,
      sessions: sessions ?? this.sessions,
    );
  }
}
