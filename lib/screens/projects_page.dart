import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
    final projects = portfolioData["projects"] as List<dynamic>;

    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          final crossAxisCount = isWide ? 2 : 1;
          const spacing = 24.0;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Scrollbar(
              thumbVisibility: true,
              radius: const Radius.circular(8),
              thickness: 10,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Projects',
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

                        // ✅ Auto-height, responsive grid
                        LayoutBuilder(
                          builder: (context, boxConstraints) {
                            return Wrap(
                              spacing: spacing,
                              runSpacing: spacing,
                              children: [
                                for (var project in projects)
                                  SizedBox(
                                    width: isWide
                                        ? (boxConstraints.maxWidth - spacing) /
                                              2
                                        : boxConstraints.maxWidth,
                                    child: _buildProjectCard(context, project),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
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

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ✅ auto-height
        children: [
          // Image
          if (project["imageUrl"] != null && project["imageUrl"].isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  project["imageUrl"]!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: Text(
                        'Image Load Error',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(height: 12),

          Text(
            project["name"] ?? '',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            project["description"] ?? '',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 8),

          if (project["details"] != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var detail in project["details"])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 6,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            detail,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

          const SizedBox(height: 12),

          // Links
          if (project["links"] != null && (project["links"] as List).isNotEmpty)
            Wrap(
              spacing: 12,
              children: [
                for (var link in project["links"])
                  if (link["url"] != null && link["url"].isNotEmpty)
                    OutlinedButton.icon(
                      onPressed: () => _launchURL(link["url"]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      icon: Icon(
                        link["type"] == 'Play Store'
                            ? Icons.play_arrow
                            : link["type"] == 'App Store'
                            ? Icons.apple
                            : Icons.link,
                        size: 18,
                      ),
                      label: Text(
                        link["type"] ?? '',
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                    ),
              ],
            ),
        ],
      ),
    );
  }
}
