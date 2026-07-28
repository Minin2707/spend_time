import 'package:flutter/material.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';

extension AppThemeModeUiMapping on AppThemeMode {
  ThemeMode toFlutterThemeMode() {
    return switch (this) {
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
    };
  }
}
