enum AppThemeMode {
  light,
  dark;

  String get storageValue {
    return switch (this) {
      AppThemeMode.light => 'light',
      AppThemeMode.dark => 'dark',
    };
  }

  static AppThemeMode fromStorageValue(
    String? value,
  ) {
    return switch (value) {
      'dark' => AppThemeMode.dark,
      'light' => AppThemeMode.light,
      _ => AppThemeMode.light,
    };
  }
}
