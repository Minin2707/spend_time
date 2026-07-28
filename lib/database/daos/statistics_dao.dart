import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';

class StatisticsDao extends DatabaseAccessor<AppDatabase> {
  StatisticsDao(
    super.database,
  );

  Future<StatisticsSummaryData> getSummary({
    required int fromMillis,
    required int toMillis,
  }) async {
    final QueryRow row = await customSelect(
      '''
    SELECT
      COALESCE(
        SUM(ended_at - started_at),
        0
      ) AS total_millis,
      COUNT(*) AS sessions_count,
      CAST(
        COALESCE(
          AVG(ended_at - started_at),
          0
        ) AS INTEGER
      ) AS average_session_millis,
      COALESCE(
        MAX(ended_at - started_at),
        0
      ) AS longest_session_millis
    FROM sessions
    WHERE ended_at IS NOT NULL
      AND started_at >= ?
      AND started_at < ?
    ''',
      variables: [
        Variable<int>(fromMillis),
        Variable<int>(toMillis),
      ],
      readsFrom: {
        attachedDatabase.sessions,
      },
    ).getSingle();

    return StatisticsSummaryData(
      totalMillis: row.read<int>(
        'total_millis',
      ),
      sessionsCount: row.read<int>(
        'sessions_count',
      ),
      averageSessionMillis: row.read<int>(
        'average_session_millis',
      ),
      longestSessionMillis: row.read<int>(
        'longest_session_millis',
      ),
    );
  }

  Future<List<TopicDistributionData>> getTopicDistribution({
    required int fromMillis,
    required int toMillis,
  }) async {
    final List<QueryRow> rows = await customSelect(
      '''
    SELECT
      topics.id AS topic_id,
      topics.name AS topic_name,
      topics.color_key AS color_key,
      SUM(sessions.ended_at - sessions.started_at) AS total_millis
    FROM sessions
    INNER JOIN topics
      ON topics.id = sessions.topic_id
    WHERE sessions.ended_at IS NOT NULL
      AND sessions.started_at >= ?
      AND sessions.started_at < ?
    GROUP BY
      topics.id,
      topics.name,
      topics.color_key
    ORDER BY
      total_millis DESC
    ''',
      variables: [
        Variable<int>(fromMillis),
        Variable<int>(toMillis),
      ],
      readsFrom: {
        attachedDatabase.sessions,
        attachedDatabase.topics,
      },
    ).get();

    return rows
        .map(
          (row) => TopicDistributionData(
            topicId: row.read<int>(
              'topic_id',
            ),
            topicName: row.read<String>(
              'topic_name',
            ),
            colorKey: row.read<String>(
              'color_key',
            ),
            totalMillis: row.read<int>(
              'total_millis',
            ),
          ),
        )
        .toList();
  }
}

class StatisticsSummaryData {
  const StatisticsSummaryData({
    required this.totalMillis,
    required this.sessionsCount,
    required this.averageSessionMillis,
    required this.longestSessionMillis,
  });

  final int totalMillis;

  final int sessionsCount;

  final int averageSessionMillis;

  final int longestSessionMillis;
}

class TopicDistributionData {
  const TopicDistributionData({
    required this.topicId,
    required this.topicName,
    required this.colorKey,
    required this.totalMillis,
  });

  final int topicId;

  final String topicName;

  final String colorKey;

  final int totalMillis;
}
