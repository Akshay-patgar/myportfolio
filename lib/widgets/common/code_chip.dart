import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

/// Monospace tech/skill chip with a colored accent dot.
class CodeChip extends StatelessWidget {
  const CodeChip(
    this.label, {
    super.key,
    this.color,
    this.fontSize = 13,
  });

  final String label;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final Color accent =
        color ?? AppColors.accentFor('cyan');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: fontSize,
              color: AppColors.textPrimary.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
