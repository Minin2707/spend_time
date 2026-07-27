import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/topic_dao.dart';
import 'package:spend_time/features/topics/data/topic_repository.dart';
import 'package:spend_time/features/topics/data/topic_update_exception.dart';

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
  }) async {
    await _topicDao.insertTopic(
      TopicsCompanion.insert(
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<void> renameTopic({
    required int id,
    required String name,
  }) async {
    final bool updated = await _topicDao.renameTopic(
      id: id,
      name: name,
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
