import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/topics/application/topic_statistics_provider.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';

class TopicCard extends ConsumerWidget {
  const TopicCard({
    super.key,
    required this.topic,
    required this.isActive,
    required this.elapsed,
    required this.onStart,
    required this.onStop,
    this.onTap,
  });

  final Topic topic;
  final bool isActive;
  final Duration elapsed;

  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback? onTap;

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final AsyncValue<TopicStatistics> statistics = ref.watch(
      topicStatisticsProvider(
        topic.id,
      ),
    );

    final TopicStatistics topicStatistics =
        statistics.value ?? TopicStatistics.empty;

    return AppCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topic.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.todayLabel,
                  ),
                ),
                Text(
                  DurationFormatter.formatClock(
                    isActive
                        ? elapsed
                        : topicStatistics.today,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSpacing.sm,
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.totalLabel,
                  ),
                ),

                Text(
                  DurationFormatter.formatClock(
                    topicStatistics.total,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            AppButton(
              text: isActive
                  ? context.l10n.stopButton
                  : context.l10n.startButton,
              onPressed: isActive
                  ? onStop
                  : onStart,
            ),
          ],
        ),
      ),
    );
  }
}
