import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/router/app_routes.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_text_field.dart';
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
    ref.listen(
      onboardingProvider,
          (_, next) {
        next.whenData((user) {
          if (user != null) {
            context.go(AppRoutes.home);
          }
        });
      },
    );

    final AsyncValue state = ref.watch(onboardingProvider);

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
            AppTextField(
              controller: _controller,
              labelText: context.l10n.nameLabel,
              textInputAction: TextInputAction.done,
            ),
            const Spacer(),
            AppButton(
              text: context.l10n.continueButton,
              isLoading: state.isLoading,
              onPressed: () async {
                final String name = _controller.text.trim();

                if (name.isEmpty) {
                  return;
                }

                await ref.read(
                  onboardingProvider.notifier,
                ).saveUser(
                  name: name,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}