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
