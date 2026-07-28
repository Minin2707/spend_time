import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/domain/app_language.dart';
import 'package:spend_time/core/settings/data/app_settings_repository.dart';
import 'package:spend_time/core/settings/data/app_settings_repository_provider.dart';

class LanguageSettingsNotifier extends AsyncNotifier<AppLanguage> {
  late final AppSettingsRepository _repository;

  @override
  Future<AppLanguage> build() {
    _repository = ref.read(
      appSettingsRepositoryProvider,
    );

    return _repository.getLanguage();
  }

  Future<void> updateLanguage({
    required AppLanguage language,
  }) async {
    final AppLanguage? currentLanguage = state.valueOrNull;

    if (currentLanguage == language) {
      return;
    }

    await _repository.updateLanguage(
      language: language,
    );

    state = AsyncData(
      language,
    );
  }
}
