import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.onSubmitted,
  });

  final TextEditingController controller;

  final String? labelText;
  final String? hintText;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final bool autofocus;
  final bool enabled;

  final int? maxLength;
  final int maxLines;

  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      autofocus: autofocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      maxLines: maxLines,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}