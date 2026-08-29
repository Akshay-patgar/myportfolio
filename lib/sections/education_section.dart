import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> education = portfolioData['education'];

    return SectionShell(
      label: '// education',
      title: 'Foundations',
      index: '06',
      listenTo: listenTo,
      maxWidth: 1000,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const double gap = 20;
          final bool wide = constraints.maxWidth > 800;
          final double itemWidth = wide
              ? (constraints.maxWidth - gap) / 2
              : constraints.maxWidth;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (int i = 0; i < education.length; i++)
                SizedBox(
                  width: itemWidth,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    delay: Duration(milliseconds: i * 150),
                    child: _EducationCard(edu: education[i], index: i),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.edu, required this.index});

  final Map<String, dynamic> edu;
  final int index;

  static const List<Color> _accents = [AppColors.cyan, AppColors.violet];

  Color get _accent => _accents[index % _accents.length];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [_accent.withValues(alpha: 0.25), _accent.withValues(alpha: 0.08)],
              ),
              border: Border.all(color: _accent.withValues(alpha: 0.4)),
            ),
            child: Icon(Icons.school_rounded, color: _accent, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edu['degree'],
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  edu['school'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                        border:
                            Border.all(color: _accent.withValues(alpha: 0.35)),
                      ),
                      child: Text(
                        edu['score'],
                        style: GoogleFonts.jetBrainsMono(
                            fontSize: 12, color: _accent),
                      ),
                    ),
                    Text(
                      edu['duration'],
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
