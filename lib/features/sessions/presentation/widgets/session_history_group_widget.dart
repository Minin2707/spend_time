import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/features/sessions/domain/session_history_group.dart';
import 'package:spend_time/features/sessions/domain/session_history_item.dart';
import 'package:spend_time/features/sessions/presentation/formatters/session_history_date_formatter.dart';
import 'package:spend_time/features/sessions/presentation/widgets/session_history_item_widget.dart';

class SessionHistoryGroupWidget extends StatelessWidget {
  const SessionHistoryGroupWidget({
    super.key,
    required this.group,
  });

  final SessionHistoryGroup group;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          SessionHistoryDateFormatter.format(
            group.date,
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        for (final SessionHistoryItem session in group.sessions) ...[
          SessionHistoryItemWidget(
            session: session,
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
        ],
      ],
    );
  }
}
