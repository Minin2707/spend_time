import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/tables/topics.dart';

part 'topic_dao.g.dart';

@DriftAccessor(
  tables: [
    Topics,
  ],
)
class TopicDao extends DatabaseAccessor<AppDatabase>
    with _$TopicDaoMixin {
  TopicDao(
      super.database,
      );

  Future<List<Topic>> getTopics() {
    return (select(topics)
      ..orderBy([
            (table) => OrderingTerm(
          expression: table.createdAt,
        ),
      ]))
        .get();
  }

  Future<int> insertTopic(
      final TopicsCompanion topic,
      ) {
    return into(topics).insert(topic);
  }

  Future<int> deleteTopic(
      final int id,
      ) {
    return (delete(topics)
      ..where(
            (table) => table.id.equals(id),
      ))
        .go();
  }
}