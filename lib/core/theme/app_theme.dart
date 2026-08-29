import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData build() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.cyan,
        secondary: AppColors.violet,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.spaceGrotesk(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceAlt,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.border),
      hoverColor: AppColors.cyan.withValues(alpha: 0.06),
      splashFactory: InkRipple.splashFactory,
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    final heading = GoogleFonts.spaceGrotesk(color: AppColors.textPrimary);
    final body = GoogleFonts.poppins(color: AppColors.textSecondary);
    return base.copyWith(
      displayLarge: heading.copyWith(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1.5,
      ),
      displayMedium: heading.copyWith(
        fontSize: 46,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -1,
      ),
      headlineLarge: heading.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.5,
      ),
      headlineMedium: heading.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      headlineSmall: heading.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: heading.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      titleMedium: heading.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: body.copyWith(fontSize: 16, height: 1.7),
      bodyMedium: body.copyWith(fontSize: 14, height: 1.7),
      bodySmall: body.copyWith(
        fontSize: 12,
        height: 1.5,
        color: AppColors.textMuted,
      ),
    );
  }
}
