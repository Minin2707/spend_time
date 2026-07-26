import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/sessions/domain/session_history_item.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';

abstract interface class SessionRepository {
  Future<Session?> getActiveSession();

  Future<List<Session>> getSessionsByTopic(
      int topicId,
      );

  Future<List<SessionHistoryItem>> getSessionHistory({
    required int topicId,
  });

  Future<Session> startSession({
    required int topicId,
    required DateTime startedAt,
  });

  Future<void> stopSession({
    required Session session,
    required DateTime endedAt,
  });

  Future<TopicStatistics> getStatistics({
    required int topicId,
  });
}
