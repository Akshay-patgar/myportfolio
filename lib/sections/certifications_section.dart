import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/launch_helper.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> certifications = portfolioData['certifications'];

    return SectionShell(
      label: '// certifications',
      title: 'Certified',
      index: '05',
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
              for (int i = 0; i < certifications.length; i++)
                SizedBox(
                  width: itemWidth,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    delay: Duration(milliseconds: i * 150),
                    child: _CertificationCard(cert: certifications[i],
                        index: i),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CertificationCard extends StatelessWidget {
  const _CertificationCard({
    required this.cert,
    required this.index,
  });

  final Map<String, dynamic> cert;
  final int index;

  static const List<Color> _accents = [
    AppColors.cyan,
    AppColors.emerald,
    AppColors.violet,
    AppColors.amber,
  ];

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      _accent.withValues(alpha: 0.25),
                      _accent.withValues(alpha: 0.08),
                    ],
                  ),
                  border: Border.all(color: _accent.withValues(alpha: 0.4)),
                ),
                child: Icon(Icons.verified_rounded, color: _accent, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cert['name'],
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cert['platform'],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () =>
                LaunchHelper.launch(cert['url'], context: context),
            icon: const Icon(Icons.open_in_new_rounded, size: 16),
            label: const Text('View Certificate'),
            style: OutlinedButton.styleFrom(
              foregroundColor: _accent,
              side: BorderSide(color: _accent.withValues(alpha: 0.5)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
