import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/code_chip.dart';
import '../widgets/common/glow_card.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  static const List<Color> _chipColors = [
    AppColors.cyan,
    AppColors.violet,
    AppColors.emerald,
    AppColors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    final List<dynamic> projects = portfolioData['projects'];

    return SectionShell(
      label: '// projects',
      title: 'Things I\'ve shipped',
      index: '03',
      subtitle:
          'Production apps used by real people — on phones, TVs and watches.',
      listenTo: listenTo,
      maxWidth: 1150,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const double gap = 24;
          final bool wide = constraints.maxWidth > 800;
          final double cardWidth = wide
              ? (constraints.maxWidth - gap) / 2
              : constraints.maxWidth;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (int i = 0; i < projects.length; i++)
                SizedBox(
                  width: cardWidth,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    offset: const Offset(0, 0.05),
                    delay: Duration(milliseconds: (i % 2) * 120),
                    child: _ProjectCard(
                      project: projects[i],
                      index: i,
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

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.index});

  final Map<String, dynamic> project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      enableTilt: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.violet.withValues(alpha: 0.55),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            project['name'],
            style: GoogleFonts.spaceGrotesk(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            project['description'],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.7),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (int t = 0; t < (project['tech'] as List).length; t++)
                CodeChip(
                  project['tech'][t],
                  color: ProjectsSection._chipColors[
                      t % ProjectsSection._chipColors.length],
                  fontSize: 12,
                ),
            ],
          ),
          const SizedBox(height: 16),
          ...List<Widget>.from(project['details'].map(
            (d) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 7.5),
                    child: Icon(Icons.circle,
                        size: 5, color: AppColors.textMuted),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      d,
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        height: 1.6,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
