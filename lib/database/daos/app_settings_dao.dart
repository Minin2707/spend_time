import 'package:drift/drift.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/tables/app_settings.dart';

part 'app_settings_dao.g.dart';

class AppSettingsData {
  const AppSettingsData({
    required this.themeMode,
  });

  final AppThemeMode themeMode;
}

@DriftAccessor(
  tables: [
    AppSettings,
  ],
)
class AppSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$AppSettingsDaoMixin {
  AppSettingsDao(
    super.database,
  );

  static const int _settingsId = 1;

  Future<AppSettingsData> getSettings() async {
    final row = await (select(appSettings)
          ..where(
            (table) => table.id.equals(
              _settingsId,
            ),
          ))
        .getSingle();

    return AppSettingsData(
      themeMode: AppThemeMode.fromStorageValue(
        row.themeMode,
      ),
    );
  }

  Future<void> updateThemeMode({
    required String themeMode,
  }) {
    return (update(appSettings)
          ..where(
            (table) => table.id.equals(
              _settingsId,
            ),
          ))
        .write(
      AppSettingsCompanion(
        themeMode: Value(
          themeMode,
        ),
      ),
    );
  }
}
