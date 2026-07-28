import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_empty_view.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/features/sessions/application/session_history_provider.dart';
import 'package:spend_time/features/sessions/domain/session_history_group.dart';
import 'package:spend_time/features/sessions/presentation/widgets/session_history_group_widget.dart';

class SessionHistoryScreen extends ConsumerWidget {
  const SessionHistoryScreen({
    super.key,
    required this.topicId,
  });

  final int topicId;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final history = ref.watch(
      sessionHistoryProvider(
        topicId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Session history',
        ),
      ),
      body: history.when(
        data: (groups) {
          if (groups.isEmpty) {
            return AppEmptyView(
              icon: Icons.history_rounded,
              title: context.l10n.noSessionHistoryTitle,
              subtitle: context.l10n.noSessionHistorySubtitle,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(
              AppSpacing.md,
            ),
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final SessionHistoryGroup group = groups[index];

              return SessionHistoryGroupWidget(
                group: group,
              );
            },
          );
        },
        loading: () => const AppLoadingView(),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
        ),
      ),
    );
  }
}
