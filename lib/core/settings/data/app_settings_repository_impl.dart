import 'package:spend_time/core/domain/app_language.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';
import 'package:spend_time/core/settings/data/app_settings_repository.dart';
import 'package:spend_time/database/daos/app_settings_dao.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl(
    this._appSettingsDao,
  );

  final AppSettingsDao _appSettingsDao;

  @override
  Future<AppLanguage> getLanguage() async {
    final AppSettingsData settings = await _appSettingsDao.getSettings();

    return settings.language;
  }

  @override
  Future<AppThemeMode> getThemeMode() async {
    final AppSettingsData settings = await _appSettingsDao.getSettings();

    return settings.themeMode;
  }

  @override
  Future<void> updateLanguage({
    required AppLanguage language,
  }) {
    return _appSettingsDao.updateLanguage(
      language: language.storageValue,
    );
  }

  @override
  Future<void> updateThemeMode({
    required AppThemeMode themeMode,
  }) {
    return _appSettingsDao.updateThemeMode(
      themeMode: themeMode.storageValue,
    );
  }
}
