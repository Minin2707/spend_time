import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';

abstract interface class TopicRepository {
  Future<List<Topic>> getTopics();

  Future<void> createTopic({
    required String name,
    required TopicColorKey colorKey,
    required TopicIconKey iconKey,
  });

  Future<void> updateTopic({
    required int id,
    required String name,
    required TopicColorKey colorKey,
    required TopicIconKey iconKey,
  });

  Future<void> deleteTopic({
    required int id,
  });
}
