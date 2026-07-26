import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/features/topics/application/topic_statistics_notifier.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';

final topicStatisticsProvider =
AsyncNotifierProvider.family<
    TopicStatisticsNotifier,
    TopicStatistics,
    int>(
  TopicStatisticsNotifier.new,
);