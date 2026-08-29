import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/code_chip.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  static const List<Color> _accents = [
    AppColors.cyan,
    AppColors.violet,
    AppColors.emerald,
    AppColors.amber,
    Color(0xFFF472B6),
    AppColors.cyan,
    AppColors.violet,
    AppColors.emerald,
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> skills = portfolioData['skills'];
    final Map<String, dynamic> labels = portfolioData['skillCategoryLabels'];
    final List<String> keys = skills.keys.toList();

    return SectionShell(
      label: '// skills',
      title: 'My toolbox',
      index: '04',
      subtitle: 'Technologies and practices I use to ship reliable products.',
      listenTo: listenTo,
      maxWidth: 1150,
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
              for (int i = 0; i < keys.length; i++)
                SizedBox(
                  width: itemWidth,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    delay: Duration(milliseconds: (i % 2) * 100),
                    child: _SkillCategory(
                      label: labels[keys[i]] ?? keys[i],
                      items: List<String>.from(skills[keys[i]]),
                      accent: _accents[i % _accents.length],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  const _SkillCategory({
    required this.label,
    required this.items,
    required this.accent,
  });

  final String label;
  final List<String> items;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: accent,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in items) CodeChip(item, color: accent),
            ],
          ),
        ],
      ),
    );
  }
}
