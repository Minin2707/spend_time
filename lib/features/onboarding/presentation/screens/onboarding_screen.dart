import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/settings/application/language_settings_provider.dart';
import 'package:spend_time/core/settings/presentation/widgets/language_selector.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_text_field.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/onboarding/application/onboarding_provider.dart';



class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  ConsumerState<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends ConsumerState<OnboardingScreen> {
  final TextEditingController _controller =
  TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final AsyncValue state = ref.watch(onboardingProvider);
    final languageSettings = ref.watch(
      languageSettingsProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.welcomeTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              context.l10n.welcomeMessage,
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.languageSectionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            languageSettings.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text(
                context.l10n.updateLanguageErrorMessage,
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
            const SizedBox(height: 24),
            AppTextField(
              controller: _controller,
              labelText: context.l10n.nameLabel,
              textInputAction: TextInputAction.done,
            ),
            const Spacer(),
            AppButton(
              text: context.l10n.continueButton,
              isLoading: state.isLoading,
              onPressed: () => _submit(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(
    BuildContext context,
  ) async {
    final String name = _controller.text.trim();

    if (name.isEmpty) {
      return;
    }

    await ref.read(
      onboardingProvider.notifier,
    ).saveUser(
      name: name,
    );

    final AsyncValue<User?> onboardingState = ref.read(
      onboardingProvider,
    );

    if (!context.mounted) {
      return;
    }

    final User? user = onboardingState.valueOrNull;

    if (user == null) {
      return;
    }

    context.go(
      AppRoutes.home,
    );
  }
}
