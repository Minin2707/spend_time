import 'package:spend_time/database/app_database.dart';

abstract interface class TopicRepository {
  Future<List<Topic>> getTopics();

  Future<void> createTopic({
    required String name,
  });

  Future<void> renameTopic({
    required int id,
    required String name,
  });

  Future<void> deleteTopic({
    required int id,
  });
}
