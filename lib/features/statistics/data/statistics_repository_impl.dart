import 'package:spend_time/core/time/clock.dart';
import 'package:spend_time/database/daos/statistics_dao.dart';
import 'package:spend_time/features/statistics/data/statistics_repository.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/statistics/domain/statistics_summary.dart';
import 'package:spend_time/features/statistics/domain/topic_distribution_item.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsRepositoryImpl({
    required StatisticsDao statisticsDao,
    required Clock clock,
  })  : _statisticsDao = statisticsDao,
        _clock = clock;

  final StatisticsDao _statisticsDao;
  final Clock _clock;

  @override
  Future<StatisticsSummary> getSummary({
    required StatisticsPeriod period,
  }) async {
    final _StatisticsRange range = _getRange(
      period,
    );

    final StatisticsSummaryData data =
        await _statisticsDao.getSummary(
      fromMillis: range.fromMillis,
      toMillis: range.toMillis,
    );

    return StatisticsSummary(
      totalTime: Duration(
        milliseconds: data.totalMillis,
      ),
      sessionsCount: data.sessionsCount,
      averageSession: Duration(
        milliseconds: data.averageSessionMillis,
      ),
      longestSession: Duration(
        milliseconds: data.longestSessionMillis,
      ),
    );
  }

  @override
  Future<List<TopicDistributionItem>> getTopicDistribution({
    required StatisticsPeriod period,
  }) async {
    final _StatisticsRange range = _getRange(
      period,
    );

    final List<TopicDistributionData> data =
        await _statisticsDao.getTopicDistribution(
      fromMillis: range.fromMillis,
      toMillis: range.toMillis,
    );

    return data
        .map(
          (item) => TopicDistributionItem(
            topicId: item.topicId,
            topicName: item.topicName,
            colorKey: TopicColorKey.fromStorageValue(
              item.colorKey,
            ),
            totalTime: Duration(
              milliseconds: item.totalMillis,
            ),
          ),
        )
        .toList();
  }

  _StatisticsRange _getRange(
    StatisticsPeriod period,
  ) {
    final DateTime now = _clock.now();

    return _StatisticsRange(
      fromMillis: _getFromMillis(
        period: period,
        now: now,
      ),
      toMillis: now.millisecondsSinceEpoch,
    );
  }

  int _getFromMillis({
    required StatisticsPeriod period,
    required DateTime now,
  }) {
    final DateTime from = switch (period) {
      StatisticsPeriod.today => DateTime(
          now.year,
          now.month,
          now.day,
        ),
      StatisticsPeriod.week => DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(
          Duration(
            days: now.weekday - DateTime.monday,
          ),
        ),
      StatisticsPeriod.month => DateTime(
          now.year,
          now.month,
        ),
      StatisticsPeriod.year => DateTime(
          now.year,
        ),
      StatisticsPeriod.all => DateTime.fromMillisecondsSinceEpoch(
          0,
        ),
    };

    return from.millisecondsSinceEpoch;
  }
}

class _StatisticsRange {
  const _StatisticsRange({
    required this.fromMillis,
    required this.toMillis,
  });

  final int fromMillis;

  final int toMillis;
}
