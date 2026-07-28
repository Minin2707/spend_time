import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_radius.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_button.dart';

class HomeTopicsEmptyView extends StatelessWidget {
  const HomeTopicsEmptyView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onCreateTopic,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onCreateTopic;

  static const double _visualSize = 132;
  static const double _iconSize = 56;
  static const double _maxTextWidth = 320;
  static const double _maxButtonWidth = 280;

  @override
  Widget build(
    BuildContext context,
  ) {
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
                borderRadius: BorderRadius.circular(
                  AppRadius.extraLarge,
                ),
              ),
              child: Icon(
                Icons.hourglass_empty_rounded,
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
            const SizedBox(
              height: AppSpacing.xl,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: _maxButtonWidth,
              ),
              child: AppButton(
                text: buttonText,
                onPressed: onCreateTopic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
