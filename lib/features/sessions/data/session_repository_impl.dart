import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/session_dao.dart';
import 'package:spend_time/features/sessions/data/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl({
    required SessionDao sessionDao,
  }) : _sessionDao = sessionDao;

  final SessionDao _sessionDao;

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
}