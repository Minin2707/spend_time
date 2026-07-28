import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_text_field.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/presentation/dialogs/create_topic_result.dart';
import 'package:spend_time/features/topics/presentation/widgets/topic_color_selector.dart';

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
  TopicColorKey _selectedColor = TopicColorKey.blue;

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
          TopicColorSelector(
            selectedColor: _selectedColor,
            onChanged: (TopicColorKey colorKey) {
              setState(() {
                _selectedColor = colorKey;
              });
            },
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
    final String name = _controller.text;

    if (name.trim().isEmpty) {
      return;
    }

    Navigator.of(context).pop(
      CreateTopicResult(
        name: name,
        colorKey: _selectedColor,
        iconKey: TopicIconKey.book,
      ),
    );
  }
}
