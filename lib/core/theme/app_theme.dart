import 'package:flutter/material.dart';
import 'package:spend_time/core/theme/app_colors.dart';
import 'package:spend_time/core/theme/app_radius.dart';
import 'package:spend_time/core/theme/app_spacing.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return _buildTheme(
      palette: _AppThemePalette.light,
      brightness: Brightness.light,
    );
  }

  static ThemeData get dark {
    return _buildTheme(
      palette: _AppThemePalette.dark,
      brightness: Brightness.dark,
    );
  }

  static ThemeData _buildTheme({
    required _AppThemePalette palette,
    required Brightness brightness,
  }) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: palette.accent,
      brightness: brightness,
      surface: palette.background,
    ).copyWith(
      primary: palette.accent,
      surface: palette.surface,
      onSurface: palette.textPrimary,
      error: palette.error,
      outline: palette.divider,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,

      scaffoldBackgroundColor: palette.background,

      colorScheme: colorScheme,

      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: palette.background,
        foregroundColor: palette.textPrimary,
      ),

      cardTheme: CardThemeData(
        color: palette.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            56,
          ),
          backgroundColor: palette.accent,
          foregroundColor: palette.onAccent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppRadius.large,
            ),
          ),
        ),
      ),



      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surface,
        labelStyle: TextStyle(
          color: palette.textSecondary,
        ),
        hintStyle: TextStyle(
          color: palette.textSecondary,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          borderSide: BorderSide.none,
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          borderSide: BorderSide(
            color: palette.error,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
          borderSide: BorderSide(
            color: palette.error,
          ),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: palette.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
        ),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: palette.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.medium,
          ),
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: palette.inverseSurface,
        contentTextStyle: TextStyle(
          color: palette.inverseText,
        ),
        behavior: SnackBarBehavior.floating,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: palette.accent,
        foregroundColor: palette.onAccent,
      ),

      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return palette.accent;
            }

            return palette.surface;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return palette.onAccent;
            }

            return palette.textPrimary;
          }),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: palette.divider,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.medium,
              ),
            ),
          ),
        ),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: palette.accent,
      ),
    );
  }
}

class _AppThemePalette {
  const _AppThemePalette({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.accent,
    required this.onAccent,
    required this.error,
    required this.inverseSurface,
    required this.inverseText,
  });

  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color divider;
  final Color accent;
  final Color onAccent;
  final Color error;
  final Color inverseSurface;
  final Color inverseText;

  static const _AppThemePalette light = _AppThemePalette(
    background: AppColors.background,
    surface: AppColors.surface,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    divider: AppColors.divider,
    accent: AppColors.primary,
    onAccent: Colors.white,
    error: AppColors.error,
    inverseSurface: AppColors.textPrimary,
    inverseText: Colors.white,
  );

  static const _AppThemePalette dark = _AppThemePalette(
    background: Color(0xFF111318),
    surface: Color(0xFF1B1F27),
    textPrimary: Color(0xFFF8FAFC),
    textSecondary: Color(0xFFA5ADBA),
    divider: Color(0xFF2A303B),
    accent: Color(0xFF60A5FA),
    onAccent: Color(0xFF08111F),
    error: Color(0xFFF87171),
    inverseSurface: Color(0xFFE5E7EB),
    inverseText: Color(0xFF111318),
  );
}
