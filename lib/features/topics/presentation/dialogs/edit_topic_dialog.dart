import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/presentation/dialogs/edit_topic_result.dart';
import 'package:spend_time/features/topics/presentation/widgets/topic_color_selector.dart';

class EditTopicDialog extends StatefulWidget {
  const EditTopicDialog({
    super.key,
    required this.initialName,
    required this.initialColor,
    required this.initialIcon,
  });

  final String initialName;
  final TopicColorKey initialColor;
  final TopicIconKey initialIcon;

  @override
  State<EditTopicDialog> createState() =>
      _EditTopicDialogState();
}

class _EditTopicDialogState extends State<EditTopicDialog> {
  late final TextEditingController _controller;
  late TopicColorKey _selectedColor;

  bool _canSave = false;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.initialName,
    );
    _selectedColor = widget.initialColor;
    _canSave = _controller.text.trim().isNotEmpty;
    _controller.addListener(
      _updateCanSave,
    );
  }

  @override
  void dispose() {
    _controller
      ..removeListener(
        _updateCanSave,
      )
      ..dispose();

    super.dispose();
  }

  void _updateCanSave() {
    final bool canSave = _controller.text.trim().isNotEmpty;

    if (canSave == _canSave) {
      return;
    }

    setState(() {
      _canSave = canSave;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        context.l10n.editTopicTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              labelText: context.l10n.editTopicNameLabel,
            ),
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            context.l10n.cancelButton,
          ),
        ),
        TextButton(
          onPressed: _canSave
              ? () {
                  Navigator.of(context).pop(
                    EditTopicResult(
                      name: _controller.text,
                      colorKey: _selectedColor,
                      iconKey: widget.initialIcon,
                    ),
                  );
                }
              : null,
          child: Text(
            context.l10n.editTopicSaveButton,
          ),
        ),
      ],
    );
  }
}
