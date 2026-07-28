import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';
import 'package:spend_time/core/settings/application/theme_settings_notifier.dart';

final themeSettingsProvider =
    AsyncNotifierProvider<ThemeSettingsNotifier, AppThemeMode>(
  ThemeSettingsNotifier.new,
);
