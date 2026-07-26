import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/providers/database_provider.dart';
import 'package:spend_time/features/topics/data/topic_repository.dart';
import 'package:spend_time/features/topics/data/topic_repository_impl.dart';

final topicRepositoryProvider = Provider<TopicRepository>(
      (ref) {
    final database = ref.watch(databaseProvider);

    return TopicRepositoryImpl(
      database.topicDao,
    );
  },
);