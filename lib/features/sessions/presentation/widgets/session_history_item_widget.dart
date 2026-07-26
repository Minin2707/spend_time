import 'package:flutter/material.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/features/sessions/domain/session_history_item.dart';
import 'package:spend_time/features/sessions/presentation/formatters/session_duration_formatter.dart';
import 'package:spend_time/features/sessions/presentation/formatters/session_history_time_formatter.dart';

class SessionHistoryItemWidget extends StatelessWidget {
  const SessionHistoryItemWidget({
    super.key,
    required this.session,
  });

  final SessionHistoryItem session;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${SessionHistoryTimeFormatter.format(
                session.startedAt,
              )} — ${SessionHistoryTimeFormatter.format(
                session.endedAt,
              )}',
            ),
          ),
          Text(
            SessionDurationFormatter.format(
              session.duration,
            ),
          ),
        ],
      ),
    );
  }
}
