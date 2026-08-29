import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class SectionNav {
  const SectionNav({required this.label, required this.key});

  final String label;
  final GlobalKey key;
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
    required this.sections,
    required this.activeIndex,
    required this.onSelect,
    required this.isCompact,
    required this.isScrolled,
  });

  final List<SectionNav> sections;
  final int activeIndex;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(
              alpha: isScrolled ? 0.82 : 0.55,
            ),
            border: Border(
              bottom: BorderSide(
                color: isScrolled ? AppColors.border : Colors.transparent,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 16 : 28,
            vertical: 10,
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                _Logo(onTap: () => onSelect(0)),
                const Spacer(),
                if (!isCompact)
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...List.generate(sections.length, (i) {
                          final bool active = i == activeIndex;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => onSelect(i),
                                behavior: HitTestBehavior.opaque,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: active
                                        ? AppColors.cyan.withValues(alpha: 0.08)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${i + 1}. ${sections[i].label}',
                                        style: GoogleFonts.jetBrainsMono(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w500,
                                          color: active
                                              ? AppColors.cyan
                                              : AppColors.textSecondary,
                                        ),
                                      ),
                                      if (active) ...[
                                        const SizedBox(height: 4),
                                        Container(
                                          width: 18,
                                          height: 2,
                                          decoration: BoxDecoration(
                                            color: AppColors.cyan,
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    ),
                  )
                else
                  _CompactMenu(
                    sections: sections,
                    activeIndex: activeIndex,
                    onSelect: onSelect,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                gradient: const LinearGradient(
                  colors: [AppColors.cyan, AppColors.violet],
                ),
              ),
              child: Text(
                'AP',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.background,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'akshay',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  TextSpan(
                    text: '.dev',
                    style: TextStyle(color: AppColors.cyan),
                  ),
                ],
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompactMenu extends StatelessWidget {
  const _CompactMenu({
    required this.sections,
    required this.activeIndex,
    required this.onSelect,
  });

  final List<SectionNav> sections;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: onSelect,
      icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      color: AppColors.surfaceAlt,
      itemBuilder: (context) => [
        for (int i = 0; i < sections.length; i++)
          PopupMenuItem(
            value: i,
            child: Text(
              '${i + 1}. ${sections[i].label}',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 13,
                color: i == activeIndex
                    ? AppColors.cyan
                    : AppColors.textPrimary,
              ),
            ),
          ),
      ],
    );
  }
}
