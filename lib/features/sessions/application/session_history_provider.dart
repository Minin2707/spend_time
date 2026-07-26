import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/features/sessions/data/session_repository_provider.dart';
import 'package:spend_time/features/sessions/domain/session_history_group.dart';
import 'package:spend_time/features/sessions/domain/session_history_grouper.dart';
import 'package:spend_time/features/sessions/domain/session_history_item.dart';

final sessionHistoryProvider =
    FutureProvider.family<List<SessionHistoryGroup>, int>(
  (
    ref,
    topicId,
  ) async {
    final repository = ref.watch(
      sessionRepositoryProvider,
    );

    final List<SessionHistoryItem> sessions =
        await repository.getSessionHistory(
      topicId: topicId,
    );

    return SessionHistoryGrouper.groupByDay(
      sessions,
    );
  },
);
