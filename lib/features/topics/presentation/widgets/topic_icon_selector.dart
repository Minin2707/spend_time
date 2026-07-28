import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_radius.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/presentation/mappers/topic_icon_mapper.dart';

class TopicIconSelector extends StatelessWidget {
  const TopicIconSelector({
    super.key,
    required this.selectedIcon,
    required this.onChanged,
  });

  final TopicIconKey selectedIcon;
  final ValueChanged<TopicIconKey> onChanged;

  static const double _maxWidth = 312;
  static const double _minTouchSize = 56;
  static const double _spacing = AppSpacing.md;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: _maxWidth,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = _crossAxisCountFor(
              constraints.maxWidth,
            );

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TopicIconKey.values.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: _spacing,
                crossAxisSpacing: _spacing,
              ),
              itemBuilder: (context, index) {
                final iconKey = TopicIconKey.values[index];

                return _TopicIconOption(
                  iconKey: iconKey,
                  isSelected: iconKey == selectedIcon,
                  onTap: () => onChanged(iconKey),
                );
              },
            );
          },
        ),
      ),
    );
  }

  int _crossAxisCountFor(
    double width,
  ) {
    if (width >= _widthForColumns(4)) {
      return 4;
    }

    if (width >= _widthForColumns(3)) {
      return 3;
    }

    return 2;
  }

  double _widthForColumns(
    int columns,
  ) {
    return (_minTouchSize * columns) + (_spacing * (columns - 1));
  }
}

class _TopicIconOption extends StatelessWidget {
  const _TopicIconOption({
    required this.iconKey,
    required this.isSelected,
    required this.onTap,
  });

  final TopicIconKey iconKey;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = isSelected
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerHighest;
    final foregroundColor = isSelected
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurfaceVariant;
    final borderColor = isSelected ? colorScheme.primary : Colors.transparent;

    return Semantics(
      button: true,
      selected: isSelected,
      label: iconKey.storageValue,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          AppRadius.large,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: TopicIconSelector._minTouchSize,
              minHeight: TopicIconSelector._minTouchSize,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppRadius.large,
              ),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 1.5 : 0,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    TopicIconMapper.iconFor(iconKey),
                    color: foregroundColor,
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.sm,
                    child: Icon(
                      Icons.check_circle_rounded,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
