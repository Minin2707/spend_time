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

  Future<int> createTopic({
    required String name,
    required String colorKey,
    required String iconKey,
    required int createdAt,
  }) {
    return into(topics).insert(
      TopicsCompanion.insert(
        name: name,
        createdAt: createdAt,
        colorKey: Value(
          colorKey,
        ),
        iconKey: Value(
          iconKey,
        ),
      ),
    );
  }

  Future<bool> updateTopic({
    required int id,
    required String name,
    required String colorKey,
    required String iconKey,
  }) async {
    final int updatedRows = await (update(topics)
      ..where(
            (table) => table.id.equals(id),
      ))
        .write(
      TopicsCompanion(
        name: Value(
          name,
        ),
        colorKey: Value(
          colorKey,
        ),
        iconKey: Value(
          iconKey,
        ),
      ),
    );

    return updatedRows > 0;
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
