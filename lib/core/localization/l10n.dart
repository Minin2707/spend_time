import 'package:flutter/widgets.dart';
import 'package:spend_time/core/localization/generated/app_localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}