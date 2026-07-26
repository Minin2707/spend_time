import 'package:spend_time/database/app_database.dart';

abstract interface class SessionRepository {
  Future<Session?> getActiveSession();

  Future<List<Session>> getSessionsByTopic(
      int topicId,
      );

  Future<Session> startSession({
    required int topicId,
    required DateTime startedAt,
  });

  Future<void> stopSession({
    required Session session,
    required DateTime endedAt,
  });
}