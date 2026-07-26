import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_text_field.dart';

class CreateTopicDialog extends StatefulWidget {
  const CreateTopicDialog({
    super.key,
  });

  @override
  State<CreateTopicDialog> createState() =>
      _CreateTopicDialogState();
}

class _CreateTopicDialogState
    extends State<CreateTopicDialog> {
  final TextEditingController _controller =
  TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.l10n.createTopicTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _controller,
            labelText: context.l10n.topicNameLabel,
            autofocus: true,
            textInputAction: TextInputAction.done,
            maxLength: 50,
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(
            height: AppSpacing.lg,
          ),
          AppButton(
            text: context.l10n.createButton,
            onPressed: _submit,
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              context.l10n.cancelButton,
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final String name = _controller.text.trim();

    if (name.isEmpty) {
      return;
    }

    Navigator.of(context).pop(name);
  }
}