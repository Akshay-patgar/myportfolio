import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/glow_card.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> experience = portfolioData['workExperience'];

    return SectionShell(
      label: '// work_experience',
      title: 'Where I\'ve built things',
      index: '02',
      subtitle:
          'A journey of shipping cross-platform products — from real-time sports tech to offline-first field tools.',
      listenTo: listenTo,
      maxWidth: 900,
      child: Column(
        children: [
          for (int i = 0; i < experience.length; i++)
            _TimelineEntry(
              job: experience[i],
              isFirst: i == 0,
              isLast: i == experience.length - 1,
              delayMs: i * 150,
              listenTo: listenTo,
            ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.job,
    required this.isFirst,
    required this.isLast,
    required this.delayMs,
    required this.listenTo,
  });

  final Map<String, dynamic> job;
  final bool isFirst;
  final bool isLast;
  final int delayMs;
  final ScrollController listenTo;

  Color get _accent => AppColors.accentFor(job['color'] ?? 'cyan');

  @override
  Widget build(BuildContext context) {
    return RevealOnScroll(
      listenTo: listenTo,
      offset: const Offset(-0.03, 0),
      delay: Duration(milliseconds: delayMs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRail(),
          const SizedBox(width: 20),
          Expanded(child: _buildCard(context)),
        ],
      ),
    );
  }

  Widget _buildRail() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 2,
          height: isFirst ? 8 : 32,
          color: AppColors.border,
        ),
        _PulsingDot(color: _accent, active: job['current'] == true),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 28, top: isFirst ? 6 : 0),
      child: GlowCard(
        accent: _accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job['role'],
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '@ ${job['company']}',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _accent,
                        ),
                      ),
                    ],
                  ),
                ),
                _DurationChip(label: job['duration'], accent: _accent),
              ],
            ),
            const SizedBox(height: 18),
            ...List<Widget>.from(job['highlights'].map(
              (h) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Icon(Icons.chevron_right_rounded,
                          size: 16, color: _accent),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        h,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.65,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  const _DurationChip({required this.label, required this.accent});

  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: accent.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(fontSize: 12, color: accent),
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  const _PulsingDot({required this.color, this.active = false});

  final Color color;
  final bool active;

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _controller = widget.active
      ? (AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1600),
        )..repeat())
      : null;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      width: 16,
      height: 16,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.background,
        border: Border.all(color: widget.color, width: 3),
        boxShadow: [
          BoxShadow(
            color: widget.color.withValues(alpha: 0.45),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
    );

    if (_controller == null) return dot;

    final AnimationController controller = _controller;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(16, 16),
          foregroundPainter: _PulseRingPainter(
            progress: CurvedAnimation(
              parent: controller,
              curve: Curves.easeOut,
            ).value,
            color: widget.color,
          ),
          child: dot,
        );
      },
    );
  }
}

/// Paints an expanding fading ring *outside* layout bounds (no overflow).
class _PulseRingPainter extends CustomPainter {
  const _PulseRingPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress >= 1 || progress <= 0) return;
    final Offset center = size.center(Offset.zero);
    final double radius = size.width / 2 + 16 * progress;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color.withValues(alpha: 0.5 * (1 - progress));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _PulseRingPainter old) =>
      old.progress != progress || old.color != color;
}
