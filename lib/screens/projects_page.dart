import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Divider(color: Color(0xFF1434A4), thickness: 2),
          const SizedBox(height: 16),
          for (var project in portfolioData["projects"])
            _buildProjectCard(context, project),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          if (project["imageUrl"] != null)
            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  project["imageUrl"]!,
                  fit: BoxFit.cover,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) return child;
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF374151),
                      child: Center(
                        child: Text(
                          'Image Load Error',
                          style: GoogleFonts.exo(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["name"],
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project["description"],
                  style: GoogleFonts.poppins(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 12),
                if (project["details"] != null) ...[
                  for (var detail in project["details"])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.circle,
                              size: 8,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              detail,
                              style: GoogleFonts.poppins(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  children: [
                    for (var link in project["links"])
                      if (link["url"] != '')
                        TextButton.icon(
                          icon: Icon(
                            link["type"] == 'Play Store'
                                ? Icons.play_arrow
                                : Icons.apple,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(
                            link["type"],
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: () => _launchURL(link["url"]),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
