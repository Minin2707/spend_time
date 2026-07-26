import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/time/clock_provider.dart';
import 'package:spend_time/database/providers/database_provider.dart';
import 'package:spend_time/features/sessions/data/session_repository.dart';
import 'package:spend_time/features/sessions/data/session_repository_impl.dart';

final Provider<SessionRepository> sessionRepositoryProvider =
Provider<SessionRepository>(
      (ref) {
    final database = ref.watch(
      databaseProvider,
    );

    final clock = ref.watch(
      clockProvider,
    );

    return SessionRepositoryImpl(
      sessionDao: database.sessionDao,
      clock: clock,
    );
  },
);