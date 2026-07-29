import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:spend_time/core/app_info/application/package_info_provider.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/settings/application/language_settings_provider.dart';
import 'package:spend_time/core/settings/application/theme_settings_provider.dart';
import 'package:spend_time/core/settings/presentation/widgets/language_selector.dart';
import 'package:spend_time/core/settings/presentation/widgets/theme_mode_selector.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  static const String _supportEmail = 'belavskijgeorgij9@gmail.com';

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeSettings = ref.watch(
      themeSettingsProvider,
    );
    final languageSettings = ref.watch(
      languageSettingsProvider,
    );
    final packageInfo = ref.watch(
      packageInfoProvider,
    );
    final PackageInfo? packageInfoValue = packageInfo.valueOrNull;
    final String? versionLabel = packageInfoValue == null
        ? null
        : context.l10n.appVersionLabel(
            packageInfoValue.version,
            packageInfoValue.buildNumber,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settingsTitle,
        ),
      ),
      body: themeSettings.when(
        loading: () => const AppLoadingView(),
        error: (error, stackTrace) => AppErrorView(
          message: context.l10n.updateThemeErrorMessage,
        ),
        data: (selectedMode) => ListView(
          padding: const EdgeInsets.all(
            AppSpacing.md,
          ),
          children: [
            Text(
              context.l10n.appearanceSectionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppSpacing.sm,
            ),
            AppCard(
              child: ThemeModeSelector(
                selectedMode: selectedMode,
                onChanged: (mode) async {
                  try {
                    await ref
                        .read(
                          themeSettingsProvider.notifier,
                        )
                        .updateThemeMode(
                          themeMode: mode,
                        );
                  } catch (_) {
                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.l10n.updateThemeErrorMessage,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: AppSpacing.lg,
            ),
            Text(
              context.l10n.languageSectionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppSpacing.sm,
            ),
            AppCard(
              child: languageSettings.when(
                loading: () => const AppLoadingView(),
                error: (error, stackTrace) => AppErrorView(
                  message: context.l10n.updateLanguageErrorMessage,
                ),
                data: (language) => LanguageSelector(
                  selectedLanguage: language,
                  onChanged: (selectedLanguage) async {
                    try {
                      await ref
                          .read(
                            languageSettingsProvider.notifier,
                          )
                          .updateLanguage(
                            language: selectedLanguage,
                          );
                    } catch (_) {
                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.l10n.updateLanguageErrorMessage,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: AppSpacing.lg,
            ),
            Text(
              context.l10n.feedbackSectionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppSpacing.sm,
            ),
            AppCard(
              padding: EdgeInsets.zero,
              child: ListTile(
                leading: Icon(
                  Icons.mail_outline_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: Text(
                  context.l10n.feedbackTitle,
                ),
                subtitle: Text(
                  context.l10n.feedbackSubtitle,
                ),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                ),
                onTap: () => _openFeedbackEmail(
                  context,
                  packageInfoValue,
                ),
              ),
            ),
            const SizedBox(
              height: AppSpacing.lg,
            ),
            Text(
              context.l10n.aboutSectionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppSpacing.sm,
            ),
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(
                      context.l10n.aboutAppTitle,
                    ),
                    subtitle: versionLabel == null
                        ? null
                        : Text(
                            versionLabel,
                          ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                    onTap: () => _showAboutDialog(
                      context,
                      packageInfoValue,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.shield_outlined,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(
                      context.l10n.privacyPolicyTitle,
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                    onTap: () => context.push(
                      AppRoutes.privacyPolicy,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openFeedbackEmail(
    BuildContext context,
    PackageInfo? packageInfo,
  ) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: _supportEmail,
      queryParameters: {
        'subject': context.l10n.feedbackEmailSubject,
        'body': context.l10n.feedbackEmailBody(
          packageInfo?.version ?? '-',
          packageInfo?.buildNumber ?? '-',
        ),
      },
    );

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (launched || !context.mounted) {
        return;
      }

      _showOpenEmailError(
        context,
      );
    } catch (_) {
      if (!context.mounted) {
        return;
      }

      _showOpenEmailError(
        context,
      );
    }
  }

  void _showOpenEmailError(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.l10n.openEmailErrorMessage,
        ),
      ),
    );
  }

  void _showAboutDialog(
    BuildContext context,
    PackageInfo? packageInfo,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    showAboutDialog(
      context: context,
      applicationName: packageInfo?.appName ?? context.l10n.appTitle,
      applicationVersion: packageInfo == null
          ? null
          : context.l10n.appVersionLabel(
              packageInfo.version,
              packageInfo.buildNumber,
            ),
      applicationIcon: CircleAvatar(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        child: const Icon(
          Icons.hourglass_bottom_rounded,
        ),
      ),
      applicationLegalese: context.l10n.aboutLocalDataDescription,
      children: [
        Text(
          context.l10n.aboutAppDescription,
        ),
      ],
    );
  }
}
