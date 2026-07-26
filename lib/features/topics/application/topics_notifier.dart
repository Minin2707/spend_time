import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/topics/data/topic_repository.dart';
import 'package:spend_time/features/topics/data/topic_repository_provider.dart';

final topicsProvider =
AsyncNotifierProvider<TopicsNotifier, List<Topic>>(
  TopicsNotifier.new,
);

class TopicsNotifier extends AsyncNotifier<List<Topic>> {
  late final TopicRepository _repository;

  @override
  Future<List<Topic>> build() async {
    _repository = ref.read(topicRepositoryProvider);

    return _loadTopics();
  }

  Future<void> createTopic({
    required String name,
  }) async {
    await _repository.createTopic(
      name: name,
    );

    state = await AsyncValue.guard(
      _loadTopics,
    );
  }

  Future<void> deleteTopic({
    required int id,
  }) async {
    await _repository.deleteTopic(
      id: id,
    );

    state = await AsyncValue.guard(
      _loadTopics,
    );
  }

  Future<List<Topic>> _loadTopics() {
    return _repository.getTopics();
  }
}