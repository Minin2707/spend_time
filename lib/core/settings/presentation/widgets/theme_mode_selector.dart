import 'package:flutter/material.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';
import 'package:spend_time/core/localization/l10n.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    super.key,
    required this.selectedMode,
    required this.onChanged,
  });

  final AppThemeMode selectedMode;
  final ValueChanged<AppThemeMode> onChanged;

  static const double _compactBreakpoint = 280;
  static const double _compactRowSpacing = 8;
  static const double _compactRowMinHeight = kMinInteractiveDimension;

  @override
  Widget build(
    BuildContext context,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < _compactBreakpoint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ThemeModeOptionRow(
                label: context.l10n.themeModeLight,
                isSelected: selectedMode == AppThemeMode.light,
                onTap: () => onChanged(
                  AppThemeMode.light,
                ),
              ),
              const SizedBox(
                height: _compactRowSpacing,
              ),
              _ThemeModeOptionRow(
                label: context.l10n.themeModeDark,
                isSelected: selectedMode == AppThemeMode.dark,
                onTap: () => onChanged(
                  AppThemeMode.dark,
                ),
              ),
            ],
          );
        }

        return _SegmentedThemeModeSelector(
          selectedMode: selectedMode,
          onChanged: onChanged,
        );
      },
    );
  }
}

class _SegmentedThemeModeSelector extends StatelessWidget {
  const _SegmentedThemeModeSelector({
    required this.selectedMode,
    required this.onChanged,
  });

  final AppThemeMode selectedMode;
  final ValueChanged<AppThemeMode> onChanged;

  @override
  Widget build(
    BuildContext context,
  ) {
    return SegmentedButton<AppThemeMode>(
      segments: [
        ButtonSegment(
          value: AppThemeMode.light,
          label: Text(
            context.l10n.themeModeLight,
          ),
        ),
        ButtonSegment(
          value: AppThemeMode.dark,
          label: Text(
            context.l10n.themeModeDark,
          ),
        ),
      ],
      showSelectedIcon: false,
      selected: {
        selectedMode,
      },
      onSelectionChanged: (selection) {
        onChanged(
          selection.first,
        );
      },
    );
  }
}

class _ThemeModeOptionRow extends StatelessWidget {
  const _ThemeModeOptionRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
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
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            12,
          ),
          child: Container(
            constraints: const BoxConstraints(
              minHeight: ThemeModeSelector._compactRowMinHeight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 1.5 : 0,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_unchecked_rounded,
                  color: foregroundColor,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: foregroundColor,
                        ),
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
