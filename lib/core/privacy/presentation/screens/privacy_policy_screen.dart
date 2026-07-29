import 'package:flutter/material.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/privacy/presentation/content/privacy_policy_content.dart';
import 'package:spend_time/core/theme/app_spacing.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final content = PrivacyPolicyContentSource.forLanguageCode(
      Localizations.localeOf(context).languageCode,
    );
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.privacyPolicyTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content.lastUpdated,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(
                height: AppSpacing.lg,
              ),
              for (final section in content.sections)
                _PrivacyPolicySectionView(
                  section: section,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrivacyPolicySectionView extends StatelessWidget {
  const _PrivacyPolicySectionView({
    required this.section,
  });

  final PrivacyPolicySection section;

  @override
  Widget build(
    BuildContext context,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          Text(
            section.body,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
