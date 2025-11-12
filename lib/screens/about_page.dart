import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';
import '../widgets/skills_widget.dart';
import '../widgets/work_experience_card.dart';
import '../widgets/education_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'About Me',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Divider(color: Color(0xFF1434A4), thickness: 2),
          const SizedBox(height: 16),
          SectionTitleWithContent(
            title: 'Professional Summary',
            child: Text(
              portfolioData["professionalSummary"]!,
              style: GoogleFonts.poppins(color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(height: 24),
          SectionTitleWithContent(
            title: 'Technical Skills',
            icon: Icons.code,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSkillCategory(
                  "Languages",
                  portfolioData["skills"]["languages"],
                  context,
                ),
                buildSkillCategory(
                  "Databases",
                  portfolioData["skills"]["databases"],
                  context,
                ),
                buildSkillCategory(
                  "API Integration",
                  portfolioData["skills"]["api"],
                  context,
                ),
                buildSkillCategory(
                  "State Management",
                  portfolioData["skills"]["stateManagement"],
                  context,
                ),
                buildSkillCategory(
                  "Tools",
                  portfolioData["skills"]["tools"],
                  context,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitleWithContent(
            title: 'Work Experience',
            icon: Icons.work,
            child: Column(
              children: [
                for (var exp in portfolioData["workExperience"])
                  buildExperienceCard(context, exp),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionTitleWithContent(
            title: 'Education',
            icon: Icons.school,
            child: Column(
              children: [
                for (var edu in portfolioData["education"])
                  buildEducationCard(context, edu),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
