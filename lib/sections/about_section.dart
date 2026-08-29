import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  @override
  Widget build(BuildContext context) {
    final bool wide = MediaQuery.sizeOf(context).width > 950;

    return SectionShell(
      label: '// about_me',
      title: 'Engineer by degree,\ncraftsman by choice',
      index: '01',
      listenTo: listenTo,
      maxWidth: 1120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: wide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (wide)
                Expanded(
                  flex: 5,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    delay: const Duration(milliseconds: 100),
                    child: _buildSummary(context),
                  ),
                )
              else
                RevealOnScroll(
                  listenTo: listenTo,
                  delay: const Duration(milliseconds: 100),
                  child: _buildSummary(context),
                ),
              SizedBox(width: wide ? 44 : 0, height: wide ? 0 : 32),
              if (wide)
                Expanded(
                  flex: 6,
                  child: RevealOnScroll(
                    listenTo: listenTo,
                    offset: const Offset(0.04, 0),
                    delay: const Duration(milliseconds: 200),
                    child: const _ProfilePanel(),
                  ),
                )
              else
                RevealOnScroll(
                  listenTo: listenTo,
                  offset: const Offset(0.04, 0),
                  delay: const Duration(milliseconds: 200),
                  child: const _ProfilePanel(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          portfolioData['professionalSummary'],
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.8,
              ),
        ),
        const SizedBox(height: 18),
        Text(
          portfolioData['careerObjective'],
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
        ),
        const SizedBox(height: 26),
        Container(height: 1, color: AppColors.border),
        const SizedBox(height: 22),
        ...[
          ['Cross-platform mobile apps', Icons.phone_android_rounded],
          ['Offline-first & sync engines', Icons.cloud_off_rounded],
          ['Real-time communication', Icons.bolt_rounded],
          ['Performance engineering', Icons.speed_rounded],
        ].map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.cyan.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.cyan.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Icon(item[1] as IconData,
                        size: 16, color: AppColors.cyan),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item[0] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary.withValues(alpha: 0.9),
                          ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class _ProfilePanel extends StatelessWidget {
  const _ProfilePanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.surfaceAlt,
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                _dot(AppColors.pink),
                const SizedBox(width: 8),
                _dot(AppColors.amber),
                const SizedBox(width: 8),
                _dot(AppColors.emerald),
                const Spacer(),
                Text(
                  'profile.dart',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _line([
                  _tok('class ', AppColors.violet, bold: true),
                  _tok('AkshayPatgar', AppColors.amber, bold: true),
                  _tok(' extends ', AppColors.violet),
                  _tok('SoftwareEngineer', AppColors.cyan),
                  _tok(' {', AppColors.textSecondary),
                ]),
                _field('name', "'Akshay Patgar'"),
                _field('base', "'Bangalore, India'"),
                _field('stack', "['Flutter', 'Dart']"),
                _field('stateManagement', "['Bloc', 'GetX', 'Provider']"),
                _field('experience', "'4+ years'"),
                _field('currentCompany', "'GeekyAnts'"),
                _line([
                  _tok('  bool ', AppColors.violet),
                  _tok('openToOpportunities', AppColors.textPrimary),
                  _tok(' => ', AppColors.violet),
                  _tok('true', AppColors.emerald, bold: true),
                  _tok(';', AppColors.textSecondary),
                ]),
                _line([_tok('}', AppColors.textSecondary)]),
                _line([_tok('// built with Flutter', AppColors.textMuted)]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );

  InlineSpan _tok(String text, Color color, {bool bold = false}) =>
      TextSpan(
        text: text,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 13,
          height: 1.7,
          color: color,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
        ),
      );

  Widget _line(List<InlineSpan> spans) => Text.rich(TextSpan(children: spans));

  Widget _field(String key, String value) {
    return _line([
      _tok('  final ', AppColors.violet),
      _tok(key.padRight(17), AppColors.textPrimary),
      _tok('= ', AppColors.textMuted),
      _tok(value, AppColors.emerald),
      _tok(';', AppColors.textMuted),
    ]);
  }
}
