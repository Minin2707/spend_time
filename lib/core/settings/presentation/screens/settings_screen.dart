import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/settings/application/theme_settings_provider.dart';
import 'package:spend_time/core/settings/presentation/widgets/theme_mode_selector.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/core/widgets/app_error_view.dart';
import 'package:spend_time/core/widgets/app_loading_view.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeSettings = ref.watch(
      themeSettingsProvider,
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
          ],
        ),
      ),
    );
  }
}
