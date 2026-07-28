import 'package:spend_time/core/domain/app_theme_mode.dart';

abstract interface class AppSettingsRepository {
  Future<AppThemeMode> getThemeMode();

  Future<void> updateThemeMode({
    required AppThemeMode themeMode,
  });
}
