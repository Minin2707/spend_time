import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_spacing.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  static const double _visualSize = 96;
  static const double _iconSize = 44;
  static const double _maxTextWidth = 320;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _visualSize,
              height: _visualSize,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: _iconSize,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(
              height: AppSpacing.xl,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: _maxTextWidth,
              ),
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
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
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
