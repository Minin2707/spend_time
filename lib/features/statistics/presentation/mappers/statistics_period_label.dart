import 'package:spend_time/core/localization/generated/app_localizations.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';

extension StatisticsPeriodLabel on StatisticsPeriod {
  String localizedLabel(
    AppLocalizations l10n,
  ) {
    return switch (this) {
      StatisticsPeriod.today => l10n.statisticsPeriodToday,
      StatisticsPeriod.week => l10n.statisticsPeriodWeek,
      StatisticsPeriod.month => l10n.statisticsPeriodMonth,
      StatisticsPeriod.year => l10n.statisticsPeriodYear,
      StatisticsPeriod.all => l10n.statisticsPeriodAll,
    };
  }
}
