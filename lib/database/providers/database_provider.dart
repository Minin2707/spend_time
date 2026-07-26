import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/app_database.dart';

final Provider<AppDatabase> databaseProvider = Provider<AppDatabase>(
      (final Ref ref) {
    final AppDatabase database = AppDatabase();

    ref.onDispose(
      database.close,
    );

    return database;
  },
);