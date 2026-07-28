import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/features/sessions/application/session_provider.dart';
import 'package:spend_time/features/topics/application/active_topic_deletion_exception.dart';
import 'package:spend_time/features/topics/application/empty_topic_name_exception.dart';
import 'package:spend_time/features/topics/application/topics_notifier.dart';
import 'package:spend_time/features/topics/data/topic_update_exception.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/presentation/dialogs/delete_topic_dialog.dart';
import 'package:spend_time/features/topics/presentation/dialogs/edit_topic_dialog.dart';
import 'package:spend_time/features/topics/presentation/dialogs/edit_topic_result.dart';
import 'package:spend_time/features/topics/presentation/widgets/home_topics_empty_view.dart';
import 'package:spend_time/features/topics/presentation/widgets/topic_card.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });



  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final topics = ref.watch(
      topicsProvider,
    );

    final session = ref.watch(
      sessionProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.homeTitle,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.analytics,
            ),
            onPressed: () {
              context.push(
                AppRoutes.statistics,
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              context.push(
                AppRoutes.settings,
              );
            },
          ),
        ],
      ),
      body: topics.when(
        data: (items) {
          if (items.isEmpty) {
            return HomeTopicsEmptyView(
              title: context.l10n.noTopicsTitle,
              subtitle: context.l10n.noTopicsSubtitle,
              buttonText: context.l10n.createTopic,
              onCreateTopic: () => _openCreateTopicScreen(
                context,
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(
              AppSpacing.md,
            ),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(
              height: AppSpacing.sm,
            ),
            itemBuilder: (context, index) {
              final topic = items[index];
              return TopicCard(
                topic: topic,
                isActive:
                session.value?.activeSession?.topicId ==
                    topic.id,
                elapsed:
                session.value?.activeSession?.topicId ==
                    topic.id
                    ? session.value?.elapsed ?? Duration.zero
                    : Duration.zero,
                onStart: () {
                  ref.read(
                    sessionProvider.notifier,
                  ).startSession(
                    topicId: topic.id,
                  );
                },
                onStop: () {
                  ref.read(
                    sessionProvider.notifier,
                  ).stopSession();
                },
                onTap: () {
                  context.push(
                    AppRoutes.sessionHistoryLocation(
                      topic.id,
                    ),
                  );
                },
                onEdit: () async {
                  final EditTopicResult? result =
                  await showDialog<EditTopicResult>(
                    context: context,
                    builder: (_) => EditTopicDialog(
                      initialName: topic.name,
                      initialColor: TopicColorKey.fromStorageValue(
                        topic.colorKey,
                      ),
                      initialIcon: TopicIconKey.fromStorageValue(
                        topic.iconKey,
                      ),
                    ),
                  );

                  if (result == null) {
                    return;
                  }

                  try {
                    await ref.read(
                      topicsProvider.notifier,
                    ).updateTopic(
                      id: topic.id,
                      name: result.name,
                      colorKey: result.colorKey,
                      iconKey: result.iconKey,
                    );
                  } on EmptyTopicNameException {
                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.l10n.emptyTopicNameMessage,
                        ),
                      ),
                    );
                  } on TopicUpdateException {
                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.l10n.updateTopicErrorMessage,
                        ),
                      ),
                    );
                  }
                },
                onDelete: () async {
                  final bool? confirmed = await showDialog<bool>(
                    context: context,
                    builder: (_) => DeleteTopicDialog(
                      topicName: topic.name,
                    ),
                  );

                  if (confirmed != true) {
                    return;
                  }

                  try {
                    await ref.read(
                      topicsProvider.notifier,
                    ).deleteTopic(
                      id: topic.id,
                    );
                  } on ActiveTopicDeletionException {
                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.l10n.deleteActiveTopicMessage,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
        loading: () => const AppLoadingView(),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreateTopicScreen(
          context,
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> _openCreateTopicScreen(
    BuildContext context,
  ) async {
    await context.push<bool>(
      AppRoutes.createTopic,
    );
  }
}
