import 'package:flutter/material.dart';
import 'package:spend_time/core/domain/app_language.dart';
import 'package:spend_time/core/localization/l10n.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  final AppLanguage selectedLanguage;
  final ValueChanged<AppLanguage> onChanged;

  @override
  Widget build(
    BuildContext context,
  ) {
    return DropdownButtonFormField<AppLanguage>(
      key: ValueKey(
        selectedLanguage,
      ),
      initialValue: selectedLanguage,
      items: [
        DropdownMenuItem(
          value: AppLanguage.system,
          child: Text(
            context.l10n.languageSystem,
          ),
        ),
        DropdownMenuItem(
          value: AppLanguage.english,
          child: Text(
            context.l10n.languageEnglish,
          ),
        ),
        DropdownMenuItem(
          value: AppLanguage.russian,
          child: Text(
            context.l10n.languageRussian,
          ),
        ),
      ],
      onChanged: (language) {
        if (language == null) {
          return;
        }

        onChanged(
          language,
        );
      },
    );
  }
}
