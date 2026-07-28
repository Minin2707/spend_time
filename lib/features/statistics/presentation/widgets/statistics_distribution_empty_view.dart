import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_radius.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_card.dart';

class StatisticsDistributionEmptyView extends StatelessWidget {
  const StatisticsDistributionEmptyView({
    super.key,
  });

  static const double _visualSize = 64;
  static const double _iconSize = 30;
  static const double _maxTextWidth = 280;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _visualSize,
            height: _visualSize,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(
                AppRadius.large,
              ),
            ),
            child: Icon(
              Icons.pie_chart_outline_rounded,
              size: _iconSize,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(
            height: AppSpacing.md,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: _maxTextWidth,
            ),
            child: Text(
              context.l10n.noStatisticsDistributionTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: _maxTextWidth,
            ),
            child: Text(
              context.l10n.noStatisticsDistributionSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
