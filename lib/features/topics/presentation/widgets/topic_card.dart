import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/utils/duration_formatter.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/topics/application/topic_statistics_provider.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/domain/topic_statistics.dart';
import 'package:spend_time/features/topics/presentation/mappers/topic_icon_mapper.dart';
import 'package:spend_time/features/topics/presentation/theme/topic_color_palette.dart';

class TopicCard extends ConsumerWidget {
  const TopicCard({
    super.key,
    required this.topic,
    required this.isActive,
    required this.elapsed,
    required this.onStart,
    required this.onStop,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final Topic topic;
  final bool isActive;
  final Duration elapsed;

  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final timerIconAnimationDuration =
        MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : const Duration(
                milliseconds: 140,
              );
    final AsyncValue<TopicStatistics> statistics = ref.watch(
      topicStatisticsProvider(
        topic.id,
      ),
    );

    final TopicStatistics topicStatistics =
        statistics.value ?? TopicStatistics.empty;
    final TopicColorKey topicColorKey =
        TopicColorKey.fromStorageValue(
      topic.colorKey,
    );
    final Color topicColor = TopicColorPalette.colorFor(
      colorKey: topicColorKey,
      brightness: Theme.of(context).brightness,
    );
    final TopicIconKey topicIconKey =
        TopicIconKey.fromStorageValue(
      topic.iconKey,
    );

    return AppCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: topicColor.withValues(
                          alpha: 0.14,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        TopicIconMapper.iconFor(
                          topicIconKey,
                        ),
                        size: 22,
                        color: topicColor,
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topic.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: AppSpacing.sm,
                          ),
                          Text(
                            context.l10n.todayLabel,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            DurationFormatter.formatClock(
                              isActive
                                  ? elapsed
                                  : topicStatistics.today,
                            ),
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                    IconButton.filled(
                      tooltip: isActive
                          ? context.l10n.stopButton
                          : context.l10n.startButton,
                      style: IconButton.styleFrom(
                        backgroundColor: topicColor,
                        foregroundColor: colorScheme.onPrimary,
                        fixedSize: const Size.square(
                          48,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      icon: AnimatedSwitcher(
                        duration: timerIconAnimationDuration,
                        transitionBuilder: (child, animation) {
                          final scale = Tween<double>(
                            begin: 0.88,
                            end: 1,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOut,
                            ),
                          );

                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: scale,
                              child: child,
                            ),
                          );
                        },
                        child: Icon(
                          isActive
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          key: ValueKey<bool>(
                            isActive,
                          ),
                        ),
                      ),
                      onPressed: isActive
                          ? onStop
                          : onStart,
                    ),
                    if (onEdit != null || onDelete != null)
                      const SizedBox(
                        width: AppSpacing.xxl,
                      ),
                  ],
                ),
                if (onEdit != null || onDelete != null)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: PopupMenuButton<_TopicCardAction>(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      icon: Icon(
                        Icons.more_vert,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      onSelected: (action) {
                        switch (action) {
                          case _TopicCardAction.edit:
                            onEdit?.call();
                          case _TopicCardAction.delete:
                            onDelete?.call();
                        }
                      },
                      itemBuilder: (context) => [
                        if (onEdit != null)
                          PopupMenuItem(
                            value: _TopicCardAction.edit,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_outlined,
                                ),
                                const SizedBox(
                                  width: AppSpacing.sm,
                                ),
                                Text(
                                  context.l10n.editTopicMenuItem,
                                ),
                              ],
                            ),
                          ),
                        if (onDelete != null)
                          PopupMenuItem(
                            value: _TopicCardAction.delete,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete_outline,
                                ),
                                const SizedBox(
                                  width: AppSpacing.sm,
                                ),
                                Text(
                                  context.l10n.deleteTopicMenuItem,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _TopicCardAction {
  edit,
  delete,
}
