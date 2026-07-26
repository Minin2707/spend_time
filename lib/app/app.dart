import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spend_time/core/localization/generated/app_localizations.dart';
import 'package:spend_time/core/router/app_router.dart';

import 'package:spend_time/core/theme/app_theme.dart';




class SpendTimeApp extends StatelessWidget {
  const SpendTimeApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      title: 'Spend Time',

      theme: AppTheme.light,

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