import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/tables/sessions.dart';

part 'session_dao.g.dart';

@DriftAccessor(
  tables: [
    Sessions,
  ],
)
class SessionDao extends DatabaseAccessor<AppDatabase>
    with _$SessionDaoMixin {
  SessionDao(
      super.database,
      );

  Future<Session?> getActiveSession() {
    return (select(sessions)
      ..where(
            (table) => table.endedAt.isNull(),
      ))
        .getSingleOrNull();
  }

  Future<List<Session>> getSessionsByTopic(
      final int topicId,
      ) {
    return (select(sessions)
      ..where(
            (table) => table.topicId.equals(topicId),
      )
      ..orderBy([
            (table) => OrderingTerm.desc(
          table.startedAt,
        ),
      ]))
        .get();
  }

  Future<int> startSession(
      final SessionsCompanion session,
      ) {
    return into(sessions).insert(session);
  }

  Future<bool> stopSession(
      final Session session,
      ) {
    return update(sessions).replace(session);
  }

  Future<Session> getSessionById(
      int id,
      ) {
    return (select(sessions)
      ..where(
            (table) => table.id.equals(id),
      ))
        .getSingle();
  }
}