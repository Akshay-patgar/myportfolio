import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/launch_helper.dart';
import '../../data/portfolio_data.dart';
import '../widgets/common/reveal_on_scroll.dart';
import '../widgets/common/section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.listenTo});

  final ScrollController listenTo;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> contact = portfolioData['contact'];

    return SectionShell(
      label: '// contact',
      title: 'Let\'s build something together',
      index: '07',
      subtitle:
          'I\'m currently open to new opportunities and interesting problems. My inbox is always open.',
      listenTo: listenTo,
      maxWidth: 760,
      centerTitle: true,
      child: Column(
        children: [
          RevealOnScroll(
            listenTo: listenTo,
            delay: const Duration(milliseconds: 100),
            child: _buildPrimaryActions(context, contact),
          ),
          const SizedBox(height: 36),
          RevealOnScroll(
            listenTo: listenTo,
            delay: const Duration(milliseconds: 220),
            child: _buildDetails(context, contact),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryActions(
      BuildContext context, Map<String, dynamic> contact) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 12,
      children: [
        FilledButton.icon(
          onPressed: () =>
              LaunchHelper.launch('mailto:${contact['email']}', context: context),
          icon: const Icon(Icons.mail_outline_rounded, size: 18),
          label: const Text('Say Hello'),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.cyan,
            foregroundColor: AppColors.background,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
        ),
        FlutterSocialButton(
          onTap: () =>
              LaunchHelper.launch(contact['linkedin'], context: context),
          buttonType: ButtonType.linkedin,
          mini: false,
          showLabel: true,
          title: 'LinkedIn',
        ),
        OutlinedButton.icon(
          onPressed: () =>
              LaunchHelper.launch(contact['resume'], context: context),
          icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
          label: const Text('View Resume'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.violet,
            side: const BorderSide(color: AppColors.violet),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context, Map<String, dynamic> contact) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _ContactRow(
            icon: Icons.alternate_email_rounded,
            text: contact['email'],
            trailing: IconButton(
              icon: const Icon(Icons.copy_rounded, size: 16),
              color: AppColors.textMuted,
              tooltip: 'Copy email',
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: contact['email']));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Email copied to clipboard'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.surfaceAlt,
                      duration: const Duration(seconds: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppColors.border),
                      ),
                    ),
                  );
                }
              },
            ),
            onTap: () =>
                LaunchHelper.launch('mailto:${contact['email']}', context: context),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          _ContactRow(
            icon: Icons.phone_outlined,
            text: contact['phone'],
            onTap: () =>
                LaunchHelper.launch('tel:${contact['phone']}', context: context),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          _ContactRow(
            icon: Icons.location_on_outlined,
            text: contact['location'],
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.text,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        Icon(icon, size: 18, color: AppColors.cyan),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13.5,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );

    if (onTap == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: row,
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: row,
        ),
      ),
    );
  }
}
