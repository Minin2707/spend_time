enum AppLanguage {
  system,
  english,
  russian;

  String get storageValue {
    return switch (this) {
      AppLanguage.system => 'system',
      AppLanguage.english => 'english',
      AppLanguage.russian => 'russian',
    };
  }

  static AppLanguage fromStorageValue(
    String? value,
  ) {
    return switch (value) {
      'system' => AppLanguage.system,
      'english' => AppLanguage.english,
      'russian' => AppLanguage.russian,
      _ => AppLanguage.system,
    };
  }
}
