import 'package:drift/drift.dart';
import 'package:spend_time/core/time/clock.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/session_dao.dart';
import 'package:spend_time/features/sessions/data/session_repository.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';


class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl({
    required SessionDao sessionDao,
    required Clock clock,
  })  : _sessionDao = sessionDao,
        _clock = clock;

  final SessionDao _sessionDao;
  final Clock _clock;

  @override
  Future<Session?> getActiveSession() {
    return _sessionDao.getActiveSession();
  }

  @override
  Future<List<Session>> getSessionsByTopic(
      final int topicId,
      ) {
    return _sessionDao.getSessionsByTopic(
      topicId,
    );
  }

  @override
  Future<Session> startSession({
    required final int topicId,
    required final DateTime startedAt,
  }) async {
    final int id = await _sessionDao.startSession(
      SessionsCompanion.insert(
        topicId: topicId,
        startedAt: startedAt.millisecondsSinceEpoch,
      ),
    );

    return _sessionDao.getSessionById(
      id,
    );
  }

  @override
  Future<void> stopSession({
    required Session session,
    required DateTime endedAt,
  }) {
    return _sessionDao.stopSession(
      session.copyWith(
        endedAt: Value(
          endedAt.millisecondsSinceEpoch,
        ),
      ),
    );
  }

  @override
  Future<TopicStatistics> getStatistics({
    required final int topicId,
  }) async {
    final DateTime now = _clock.now();

    final DateTime startOfToday = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final DateTime endOfToday =
    startOfToday.add(
      const Duration(
        days: 1,
      ),
    );

    final int totalMillis =
    await _sessionDao.getTotalDurationMillis(
      topicId,
    );
    final int todayMillis =
    await _sessionDao.getDurationBetween(
      topicId,
      startOfToday.millisecondsSinceEpoch,
      endOfToday.millisecondsSinceEpoch,
    );

    return TopicStatistics(
      today: Duration(
        milliseconds: todayMillis,
      ),
      total: Duration(
        milliseconds: totalMillis,
      ),
    );
  }
}