import 'package:flutter/widgets.dart';
import 'package:spend_time/core/domain/app_language.dart';

extension AppLanguageUiMapping on AppLanguage {
  Locale? toFlutterLocale() {
    return switch (this) {
      AppLanguage.system => null,
      AppLanguage.english => const Locale(
          'en',
        ),
      AppLanguage.russian => const Locale(
          'ru',
        ),
    };
  }
}
