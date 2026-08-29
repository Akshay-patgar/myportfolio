import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Base surfaces (near-black with a cool blue tint).
  static const Color background = Color(0xFF0A0E17);
  static const Color surface = Color(0xFF121724);
  static const Color surfaceAlt = Color(0xFF161C2B);
  static const Color surfaceRaised = Color(0xFF1C2436);
  static const Color border = Color(0xFF222C40);
  static const Color borderSoft = Color(0xFF1A2233);

  // Signature accents.
  static const Color cyan = Color(0xFF3EE6E0);
  static const Color emerald = Color(0xFF4ADE80);
  static const Color violet = Color(0xFF9C8CfF);
  static const Color amber = Color(0xFFFBBF24);
  static const Color pink = Color(0xFFF472B6);

  // Greys.
  static const Color textPrimary = Color(0xFFE9EDF6);
  static const Color textSecondary = Color(0xFF9AA7BC);
  static const Color textMuted = Color(0xFF64718A);

  static const List<Color> heroOrbs = [cyan, violet, emerald];

  static Color accentFor(String key) {
    switch (key) {
      case 'cyan':
        return cyan;
      case 'violet':
        return violet;
      case 'emerald':
        return emerald;
      case 'amber':
        return amber;
      case 'pink':
        return pink;
      default:
        return cyan;
    }
  }
}
