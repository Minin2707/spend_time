import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/sessions/application/session_provider.dart';
import 'package:spend_time/features/statistics/application/statistics_provider.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/topics/application/active_topic_deletion_exception.dart';
import 'package:spend_time/features/topics/application/empty_topic_name_exception.dart';
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

  Future<void> renameTopic({
    required int id,
    required String name,
  }) async {
    final String normalizedName = name.trim();

    if (normalizedName.isEmpty) {
      throw const EmptyTopicNameException();
    }

    await _repository.renameTopic(
      id: id,
      name: normalizedName,
    );

    for (final StatisticsPeriod period in StatisticsPeriod.values) {
      ref.invalidate(
        topicDistributionProvider(
          period,
        ),
      );
    }

    state = await AsyncValue.guard(
      _loadTopics,
    );
  }

  Future<void> deleteTopic({
    required int id,
  }) async {
    final activeSession =
        ref.read(
          sessionProvider,
        ).value?.activeSession;

    if (activeSession?.topicId == id) {
      throw ActiveTopicDeletionException(
        topicId: id,
      );
    }

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
