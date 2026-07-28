import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/generated/app_localizations.dart';
import 'package:spend_time/core/router/app_router.dart';
import 'package:spend_time/core/settings/application/theme_settings_provider.dart';
import 'package:spend_time/core/theme/app_theme.dart';
import 'package:spend_time/core/theme/app_theme_mode_ui_mapping.dart';




class SpendTimeApp extends ConsumerWidget {
  const SpendTimeApp({
    super.key,
  });

  @override
  Widget build(
    final BuildContext context,
    final WidgetRef ref,
  ) {
    final themeMode = ref.watch(
      themeSettingsProvider,
    ).valueOrNull?.toFlutterThemeMode() ?? ThemeMode.light;

    return MaterialApp.router(
      title: 'Spend Time',

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,

      routerConfig: AppRouter.router,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: AppLocalizations.supportedLocales,

    );
  }
}
