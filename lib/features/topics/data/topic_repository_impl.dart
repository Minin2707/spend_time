import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/topic_dao.dart';
import 'package:spend_time/features/topics/data/topic_repository.dart';
import 'package:spend_time/features/topics/data/topic_update_exception.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';

class TopicRepositoryImpl implements TopicRepository {
  const TopicRepositoryImpl(
      this._topicDao,
      );

  final TopicDao _topicDao;

  @override
  Future<List<Topic>> getTopics() {
    return _topicDao.getTopics();
  }

  @override
  Future<void> createTopic({
    required String name,
    required TopicColorKey colorKey,
  }) async {
    await _topicDao.createTopic(
      TopicsCompanion.insert(
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        colorKey: Value(
          colorKey.storageValue,
        ),
      ),
    );
  }

  @override
  Future<void> updateTopic({
    required int id,
    required String name,
    required TopicColorKey colorKey,
  }) async {
    final bool updated = await _topicDao.updateTopic(
      id: id,
      name: name,
      colorKey: colorKey.storageValue,
    );

    if (!updated) {
      throw TopicUpdateException(
        topicId: id,
      );
    }
  }

  @override
  Future<void> deleteTopic({
    required int id,
  }) async {
    await _topicDao.deleteTopic(id);
  }
}
