import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_empty_view.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:spend_time/features/sessions/application/session_provider.dart';
import 'package:spend_time/features/topics/application/topics_notifier.dart';
import 'package:spend_time/features/topics/presentation/dialogs/create_topic_dialog.dart';
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
      ),
      body: topics.when(
        data: (items) {
          if (items.isEmpty) {
            return AppEmptyView(
              icon: Icons.schedule,
              title: context.l10n.noTopicsTitle,
              subtitle: context.l10n.noTopicsSubtitle,
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
        onPressed: () async {
          final String? name = await showDialog<String>(
            context: context,
            builder: (_) => const CreateTopicDialog(),
          );

          if (name == null) {
            return;
          }

          await ref.read(
            topicsProvider.notifier,
          ).createTopic(
            name: name,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
