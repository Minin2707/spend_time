import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';

class EditTopicDialog extends StatefulWidget {
  const EditTopicDialog({
    super.key,
    required this.initialName,
  });

  final String initialName;

  @override
  State<EditTopicDialog> createState() =>
      _EditTopicDialogState();
}

class _EditTopicDialogState extends State<EditTopicDialog> {
  late final TextEditingController _controller;

  bool _canSave = false;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.initialName,
    );
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
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          labelText: context.l10n.editTopicNameLabel,
        ),
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
                    _controller.text,
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
