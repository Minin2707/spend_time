import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';

class DeleteTopicDialog extends StatelessWidget {
  const DeleteTopicDialog({
    super.key,
    required this.topicName,
  });

  final String topicName;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.deleteTopicTitle,
      ),
      content: Text(
        context.l10n.deleteTopicMessage(
          topicName,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              false,
            );
          },
          child: Text(
            context.l10n.cancelButton,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            Navigator.of(context).pop(
              true,
            );
          },
          child: Text(
            context.l10n.deleteTopicConfirmButton,
          ),
        ),
      ],
    );
  }
}
