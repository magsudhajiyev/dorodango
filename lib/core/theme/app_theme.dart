import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.light(
          primary: AppColors.clay,
          secondary: AppColors.shine,
          surface: AppColors.surface,
          error: AppColors.error,
          onPrimary: Colors.white,
          onSecondary: AppColors.ink,
          onSurface: AppColors.ink,
          onError: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: AppTypography.display,
          headlineLarge: AppTypography.h1,
          headlineMedium: AppTypography.h2,
          bodyLarge: AppTypography.bodyLg,
          bodyMedium: AppTypography.body,
          bodySmall: AppTypography.caption,
          labelLarge: AppTypography.label,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.bg,
          foregroundColor: AppColors.ink,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: AppTypography.h2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.clay,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: AppTypography.label.copyWith(color: Colors.white),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.clay,
            minimumSize: const Size(double.infinity, 56),
            side: const BorderSide(color: AppColors.clay),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            textStyle: AppTypography.label,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.clay,
            textStyle: AppTypography.label,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceSunk,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          hintStyle: AppTypography.body.copyWith(color: AppColors.inkFaint),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.surfaceSunk,
          thickness: 1,
          space: 0,
        ),
      );
}
