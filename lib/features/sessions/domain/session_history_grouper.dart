import 'package:spend_time/features/sessions/domain/session_history_group.dart';
import 'package:spend_time/features/sessions/domain/session_history_item.dart';

class SessionHistoryGrouper {
  const SessionHistoryGrouper._();

  static List<SessionHistoryGroup> groupByDay(
    List<SessionHistoryItem> sessions,
  ) {
    final Map<DateTime, List<SessionHistoryItem>> sessionsByDate = {};

    for (final SessionHistoryItem session in sessions) {
      final DateTime date = DateTime(
        session.startedAt.year,
        session.startedAt.month,
        session.startedAt.day,
      );

      sessionsByDate.putIfAbsent(
        date,
        () => [],
      ).add(
        session,
      );
    }

    return sessionsByDate.entries
        .map(
          (entry) => SessionHistoryGroup(
            date: entry.key,
            sessions: entry.value,
          ),
        )
        .toList();
  }
}
