import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/topic_dao.dart';
import 'package:spend_time/features/topics/data/topic_repository.dart';

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
  Future<void> deleteTopic({
    required int id,
  }) async {
    await _topicDao.deleteTopic(id);
  }
}