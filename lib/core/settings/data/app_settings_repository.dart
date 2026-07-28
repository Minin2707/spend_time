import 'package:spend_time/core/domain/app_language.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';

abstract interface class AppSettingsRepository {
  Future<AppLanguage> getLanguage();

  Future<AppThemeMode> getThemeMode();

  Future<void> updateLanguage({
    required AppLanguage language,
  });

  Future<void> updateThemeMode({
    required AppThemeMode themeMode,
  });
}
