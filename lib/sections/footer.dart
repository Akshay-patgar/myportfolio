import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
        color: Color(0xFF080B13),
      ),
      child: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        _prompt(),
                        _cmd(' whoami'),
                      ]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Akshay Patgar — Software Developer',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12.5,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(children: [
                        _prompt(),
                        _cmd(' cat thanks.txt'),
                      ]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Thanks for scrolling all the way down. Let's talk!",
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12.5,
                        color: AppColors.emerald,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '© 2026 Akshay Patgar · Designed & built with Flutter',
              style: GoogleFonts.poppins(
                fontSize: 12.5,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InlineSpan _prompt() => TextSpan(
        text: '❯',
        style: GoogleFonts.jetBrainsMono(
          fontSize: 12.5,
          color: AppColors.cyan,
          fontWeight: FontWeight.w700,
        ),
      );

  InlineSpan _cmd(String cmd) => TextSpan(
        text: cmd,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 12.5,
          color: AppColors.textPrimary,
        ),
      );
}
