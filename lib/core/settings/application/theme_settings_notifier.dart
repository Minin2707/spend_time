import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/domain/app_theme_mode.dart';
import 'package:spend_time/core/settings/data/app_settings_repository.dart';
import 'package:spend_time/core/settings/data/app_settings_repository_provider.dart';

class ThemeSettingsNotifier extends AsyncNotifier<AppThemeMode> {
  late final AppSettingsRepository _repository;

  @override
  Future<AppThemeMode> build() {
    _repository = ref.read(
      appSettingsRepositoryProvider,
    );

    return _repository.getThemeMode();
  }

  Future<void> updateThemeMode({
    required AppThemeMode themeMode,
  }) async {
    final AppThemeMode? currentThemeMode = state.valueOrNull;

    if (currentThemeMode == themeMode) {
      return;
    }

    await _repository.updateThemeMode(
      themeMode: themeMode,
    );

    state = AsyncData(
      themeMode,
    );
  }
}
