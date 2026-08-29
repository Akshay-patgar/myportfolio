import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import 'reveal_on_scroll.dart';
import 'typing_text.dart';

/// Standard section scaffold: max-width container, `// label` code tag,
/// big heading and optional subtitle — all revealed on scroll.
class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.child,
    this.listenTo,
    this.maxWidth = 1100,
    this.centerTitle = false,
    this.index,
  });

  final String label;
  final String title;
  final String? subtitle;
  final Widget? child;
  final ScrollController? listenTo;
  final double maxWidth;
  final bool centerTitle;
  final String? index;

  @override
  Widget build(BuildContext context) {
    final bool wide = MediaQuery.sizeOf(context).width > 700;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: wide ? 48 : 20,
        vertical: wide ? 84 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: centerTitle
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              RevealOnScroll(
                listenTo: listenTo,
                child: _Header(index: index, label: label, wide: wide),
              ),
              const SizedBox(height: 14),
              RevealOnScroll(
                listenTo: listenTo,
                delay: const Duration(milliseconds: 80),
                child: Text(
                  title,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: wide ? 36 : 26,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    letterSpacing: -0.5,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 12),
                RevealOnScroll(
                  listenTo: listenTo,
                  delay: const Duration(milliseconds: 140),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      subtitle!,
                      textAlign:
                          centerTitle ? TextAlign.center : TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 36),
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.label, required this.wide, this.index});

  final String label;
  final bool wide;
  final String? index;

  @override
  Widget build(BuildContext context) {
    final Widget labelTag = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index != null) ...[
          Text(
            index!,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(width: 12),
          Container(width: 28, height: 1, color: AppColors.border),
          const SizedBox(width: 12),
        ],
        CodeLabel(label, color: AppColors.cyan),
      ],
    );

    final Widget labelFull = Row(
      children: [
        labelTag,
        SizedBox(width: wide ? 16 : 10),
        Expanded(
          child: Container(height: 1, color: AppColors.borderSoft),
        ),
      ],
    );

    if (!wide) return labelTag;
    return labelFull;
  }
}
