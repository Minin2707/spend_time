import 'package:flutter/material.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/presentation/theme/topic_color_palette.dart';

class TopicColorSelector extends StatelessWidget {
  const TopicColorSelector({
    super.key,
    required this.selectedColor,
    required this.onChanged,
  });

  final TopicColorKey selectedColor;
  final ValueChanged<TopicColorKey> onChanged;

  static const double _touchSize = 44;
  static const double _colorSize = 24;
  static const double _selectedColorSize = 28;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final colorKey in TopicColorKey.values)
          _TopicColorOption(
            colorKey: colorKey,
            color: TopicColorPalette.colorFor(
              colorKey: colorKey,
              brightness: brightness,
            ),
            isSelected: colorKey == selectedColor,
            onTap: () => onChanged(colorKey),
          ),
      ],
    );
  }
}

class _TopicColorOption extends StatelessWidget {
  const _TopicColorOption({
    required this.colorKey,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final TopicColorKey colorKey;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorSize = isSelected
        ? TopicColorSelector._selectedColorSize
        : TopicColorSelector._colorSize;

    return Semantics(
      button: true,
      selected: isSelected,
      label: colorKey.storageValue,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox.square(
          dimension: TopicColorSelector._touchSize,
          child: Center(
            child: Container(
              width: colorSize + (isSelected ? 8 : 0),
              height: colorSize + (isSelected ? 8 : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(
                  alpha: isSelected ? 0.14 : 0.0,
                ),
                border: Border.all(
                  color: color.withValues(
                    alpha: isSelected ? 0.34 : 0.0,
                  ),
                  width: isSelected ? 1.5 : 0,
                ),
              ),
              child: Center(
                child: Container(
                  width: colorSize,
                  height: colorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          size: 14,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
