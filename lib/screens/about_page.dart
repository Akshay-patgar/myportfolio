import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = portfolioData;
    final skills = data["skills"] as Map<String, dynamic>;

    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Padding(
              // gives some space for the scrollbar to sit on right
              padding: const EdgeInsets.only(right: 8.0),
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(8),
                thickness: 10,
                interactive: true,
                trackVisibility: false,
                child: SingleChildScrollView(
                  key: ValueKey(isWide),
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Flex(
                        direction: isWide ? Axis.horizontal : Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // LEFT COLUMN — About + Education
                          Expanded(
                            flex: isWide ? 4 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Me',
                                  style: GoogleFonts.poppins(
                                    fontSize: isWide ? 36 : 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Divider(
                                  color: Color(0xFF1434A4),
                                  thickness: 2,
                                  endIndent: 200,
                                ),
                                const SizedBox(height: 16),

                                SectionTitleWithContent(
                                  title: 'Professional Summary',
                                  child: Text(
                                    data["professionalSummary"] ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: isWide ? 16 : 15,
                                      color: Colors.grey.shade700,
                                      height: 1.6,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Education now stacked vertically
                                SectionTitleWithContent(
                                  title: 'Education',
                                  icon: Icons.school,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var edu in data["education"])
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 16.0,
                                          ),
                                          child: SizedBox(
                                            height: 140,
                                            width: double.infinity,
                                            child: _buildInfoTile(
                                              context,
                                              title: edu["degree"],
                                              subtitle: edu["school"],
                                              duration: edu["duration"],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (isWide)
                            const SizedBox(width: 48)
                          else
                            const SizedBox(height: 32),

                          // RIGHT COLUMN — Skills + Work Experience
                          Expanded(
                            flex: isWide ? 5 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionTitleWithContent(
                                  title: 'Technical Skills',
                                  icon: Icons.code,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var entry in skills.entries)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 16.0,
                                            ),
                                            child: _buildSkillCategory(
                                              context,
                                              entry.key,
                                              List<String>.from(entry.value),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 32),

                                SectionTitleWithContent(
                                  title: 'Work Experience',
                                  icon: Icons.work_outline,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var exp in data["workExperience"])
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 16.0,
                                          ),
                                          child: SizedBox(
                                            height: 140,
                                            child: _buildInfoTile(
                                              context,
                                              title: exp["role"],
                                              subtitle: exp["company"],
                                              duration: exp["duration"],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<String> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map(
                (skill) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    skill,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    String? title,
    String? subtitle,
    String? duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title.isNotEmpty)
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          if (subtitle != null && subtitle.isNotEmpty)
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          const Spacer(),
          if (duration != null && duration.isNotEmpty)
            Text(
              duration,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
        ],
      ),
    );
  }
}
