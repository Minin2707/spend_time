import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/domain/app_language.dart';
import 'package:spend_time/core/settings/application/language_settings_notifier.dart';

final languageSettingsProvider =
    AsyncNotifierProvider<LanguageSettingsNotifier, AppLanguage>(
  LanguageSettingsNotifier.new,
);
