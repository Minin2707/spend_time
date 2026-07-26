import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/time/clock_provider.dart';
import 'package:spend_time/database/daos/statistics_dao.dart';
import 'package:spend_time/database/providers/database_provider.dart';
import 'package:spend_time/features/statistics/data/statistics_repository.dart';
import 'package:spend_time/features/statistics/data/statistics_repository_impl.dart';

final statisticsRepositoryProvider =
    Provider<StatisticsRepository>(
  (ref) {
    final database = ref.watch(
      databaseProvider,
    );

    final clock = ref.watch(
      clockProvider,
    );

    return StatisticsRepositoryImpl(
      statisticsDao: StatisticsDao(
        database,
      ),
      clock: clock,
    );
  },
);
