import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          final imageSize = isWide ? 220.0 : 160.0;
          final spacing = isWide ? 64.0 : 32.0;

          final profileImage = AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
            ),
            child: ClipOval(
              child: Image.asset("assets/profile.png", fit: BoxFit.cover),
            ),
          );

          final introTexts = AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: isWide ? 24 : 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: isWide
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: GoogleFonts.poppins(
                    fontSize: isWide ? 48 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  child: const Text("Hello, I'm Akshay"),
                ),
                const SizedBox(height: 8),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: GoogleFonts.poppins(
                    fontSize: isWide ? 22 : 18,
                    color: Colors.grey.shade600,
                  ),
                  child: Text(
                    portfolioData["tagline"]!,
                    textAlign: isWide ? TextAlign.left : TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isWide ? 480 : double.infinity,
                  ),
                  child: SectionTitleWithContent(
                    title: 'Professional Summary',
                    child: Text(
                      portfolioData["professionalSummary"]!,
                      style: GoogleFonts.poppins(color: Colors.grey.shade600),
                      textAlign: isWide ? TextAlign.left : TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: isWide
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  spacing: 18,
                  children: [
                    FlutterSocialButton(
                      mini: true,
                      buttonType: ButtonType.linkedin,
                      onTap: () =>
                          _launchURL(portfolioData["contact"]["linkedin"]),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Added Buttons: Download Resume & Contact Me
                Wrap(
                  alignment: isWide
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.download),
                      label: const Text("Download Resume"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1434A4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                      ),
                      onPressed: () => _launchURL(
                        portfolioData['contact']['resume'],
                      ), // update URL
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.mail_outline),
                      label: const Text("Contact Me"),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1434A4)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                      ),
                      onPressed: () => _launchURL(
                        "mailto:${portfolioData['contact']['email']}",
                      ), // update email
                    ),
                  ],
                ),
              ],
            ),
          );

          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isWide ? 32 : 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Flex(
                    direction: isWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileImage,
                      SizedBox(
                        width: isWide ? spacing : 0,
                        height: isWide ? 0 : spacing,
                      ),
                      if (isWide) Expanded(child: introTexts) else introTexts,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
