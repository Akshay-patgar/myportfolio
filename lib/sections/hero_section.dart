import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/launch_helper.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/orbs_background.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/typing_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.listenTo,
    required this.onViewWork,
  });

  final ScrollController listenTo;
  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final bool wide = size.width > 950;
    final double avatarSize = wide ? 300 : (size.width * 0.5).clamp(190, 260);
    final double topPad =
        MediaQuery.paddingOf(context).top + kToolbarHeight + 16;

    return OrbsBackground(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: wide ? size.height - 64 : 0),
        padding: EdgeInsets.fromLTRB(
            wide ? 48 : 20, topPad, wide ? 48 : 20, 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 3, child: _buildIntro(context, wide)),
                      const SizedBox(width: 56),
                      _buildAvatar(context, avatarSize),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAvatar(context, avatarSize),
                      const SizedBox(height: 40),
                      _buildIntro(context, wide),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntro(BuildContext context, bool wide) {
    return Column(
      crossAxisAlignment:
          wide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 100),
          child: _AvailabilityChip(),
        ),
        const SizedBox(height: 22),
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 180),
          child: Text(
            'AKSHAY PATGAR',
            textAlign: wide ? TextAlign.start : TextAlign.center,
            style: GoogleFonts.spaceGrotesk(
              fontSize: wide ? 60 : 36,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.05,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 12),
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 260),
          child: TypingText(
            words: List<String>.from(portfolioData['roles']),
            cursorColor: AppColors.cyan,
            style: GoogleFonts.jetBrainsMono(
              fontSize: wide ? 22 : 16,
              fontWeight: FontWeight.w600,
              color: AppColors.cyan,
            ),
          ),
        ),
        const SizedBox(height: 22),
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 340),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              portfolioData['professionalSummary'],
              textAlign: wide ? TextAlign.start : TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 420),
          child: _buildActions(context, wide),
        ),
        const SizedBox(height: 34),
        RevealOnScroll(
          listenTo: listenTo,
          delay: const Duration(milliseconds: 500),
          child: _buildMetaRow(context, wide),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context, bool wide) {
    return Wrap(
      alignment: wide ? WrapAlignment.start : WrapAlignment.center,
      spacing: 14,
      runSpacing: 12,
      children: [
        FilledButton.icon(
          onPressed: onViewWork,
          icon: const Icon(Icons.arrow_forward_rounded, size: 18),
          label: const Text('View My Work'),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.cyan,
            foregroundColor: AppColors.background,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () => LaunchHelper.launch(
            portfolioData['contact']['resume'],
            context: context,
          ),
          icon: const Icon(Icons.download_rounded, size: 18),
          label: const Text('Download Resume'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: const BorderSide(color: AppColors.border),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetaRow(BuildContext context, bool wide) {
    final contact = portfolioData['contact'] as Map<String, dynamic>;

    final Widget location = _Meta(
      icon: Icons.location_on_outlined,
      text: 'Bangalore, IN',
    );
    final Widget role = _Meta(
      icon: Icons.work_outline_rounded,
      text: 'Flutter Developer',
    );
    final Widget linkedin = SizedBox(
      width: 42,
      height: 42,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: FlutterSocialButton(
          mini: true,
          buttonType: ButtonType.linkedin,
          onTap: () =>
              LaunchHelper.launch(contact['linkedin'], context: context),
        ),
      ),
    );
    final Widget email = _RoundIconButton(
      icon: Icons.alternate_email_rounded,
      tooltip: contact['email'],
      onTap: () =>
          LaunchHelper.launch('mailto:${contact['email']}', context: context),
    );

    if (!wide) {
      Widget cell(Widget child) => Expanded(
            child: Center(child: child),
          );
      return Column(
        children: [
          Row(children: [cell(location), cell(role)]),
          const SizedBox(height: 18),
          Row(children: [cell(linkedin), cell(email)]),
        ],
      );
    }

    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 22,
      runSpacing: 14,
      children: [location, role, linkedin, email],
    );
  }

  Widget _buildAvatar(BuildContext context, double size) {
    return RevealOnScroll(
      listenTo: listenTo,
      offset: const Offset(0.04, 0),
      delay: const Duration(milliseconds: 350),
      duration: const Duration(milliseconds: 800),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size + 26,
            height: size + 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.cyan.withValues(alpha: 0.45),
                width: 1.5,
              ),
            ),
          ),
          RotatingRing(size: size + 26),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.surfaceRaised, width: 4),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/profile.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Text(
                    'AP',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: size * 0.32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyan,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.emerald.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.emerald.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.emerald,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Open to new opportunities',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: AppColors.emerald,
            ),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.textMuted),
        const SizedBox(width: 7),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13.5,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.onTap,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final Widget button = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceAlt,
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(icon, size: 18, color: AppColors.textPrimary),
        ),
      ),
    );
    if (tooltip == null) return button;
    return Tooltip(
      message: tooltip!,
      triggerMode: TooltipTriggerMode.tap,
      child: button,
    );
  }
}
