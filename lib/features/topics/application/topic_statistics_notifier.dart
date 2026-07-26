import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/features/sessions/data/session_repository_provider.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';

class TopicStatisticsNotifier
    extends FamilyAsyncNotifier<TopicStatistics, int> {
  @override
  Future<TopicStatistics> build(
      int topicId,
      ) async {
    final repository = ref.read(
      sessionRepositoryProvider,
    );

    return repository.getStatistics(
      topicId: topicId,
    );
  }

}
