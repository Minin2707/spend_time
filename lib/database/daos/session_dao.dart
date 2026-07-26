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

  Future<int> getTotalDurationMillis(
      final int topicId,
      ) async {
    final QueryRow row = await customSelect(
      '''
    SELECT
      COALESCE(
        SUM(ended_at - started_at),
        0
      ) AS total_duration
    FROM sessions
    WHERE topic_id = ?
      AND ended_at IS NOT NULL
    ''',
      variables: [
        Variable<int>(topicId),
      ],
      readsFrom: {
        sessions,
      },
    ).getSingle();

    return row.read<int>(
      'total_duration',
    );
  }

  Future<int> getDurationBetween(
      final int topicId,
      final int from,
      final int to,
      ) async {
    final QueryRow row = await customSelect(
      '''
    SELECT
      COALESCE(
        SUM(ended_at - started_at),
        0
      ) AS total_duration
    FROM sessions
    WHERE topic_id = ?
      AND ended_at IS NOT NULL
      AND started_at >= ?
      AND ended_at <= ?
    ''',
      variables: [
        Variable<int>(topicId),
        Variable<int>(from),
        Variable<int>(to),
      ],
      readsFrom: {
        sessions,
      },
    ).getSingle();

    return row.read<int>(
      'total_duration',
    );
  }

// TODO: В будущей версии учитывать сессии,
// пересекающие границы периода.
}