import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/settings/data/app_settings_repository.dart';
import 'package:spend_time/core/settings/data/app_settings_repository_impl.dart';
import 'package:spend_time/database/providers/database_provider.dart';

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>(
  (ref) {
    final database = ref.watch(
      databaseProvider,
    );

    return AppSettingsRepositoryImpl(
      database.appSettingsDao,
    );
  },
);
